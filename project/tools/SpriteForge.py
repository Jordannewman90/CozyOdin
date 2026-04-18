import os
import json
from PIL import Image, ImageOps

class SpriteForge:
    """
    Standardized Sprite Processing Tool based on LibreSprite/Aseprite Logic.
    Ensures frame-perfect consistency, metadata export, and automated scaling.
    """
    
    def __init__(self, frame_size=64, chroma_key=(255, 0, 255)):
        self.frame_size = frame_size
        self.chroma_key = chroma_key
        self.scale_factor = None # Calculated dynamically across a set

    def calculate_master_scale(self, image_paths, padding=8):
        """Finds the absolute max dimension across all provided sheets to ensure global consistency."""
        max_d = 0
        for path in image_paths:
            img = Image.open(path).convert("RGB")
            qw, qh = img.width // 2, img.height // 2
            for r in range(2):
                for c in range(2):
                    quad = img.crop((c*qw, r*qh, (c+1)*qw, (r+1)*qh))
                    bbox = quad.getbbox()
                    if bbox:
                        max_d = max(max_d, bbox[2]-bbox[0], bbox[3]-bbox[1])
        
        self.scale_factor = (self.frame_size - padding) / max_d
        print(f"[SpriteForge] Master Scale Calculated: {self.scale_factor} (Max Dim: {max_d})")
        return self.scale_factor

    def forge_sheet(self, input_path, output_path, mirror=False):
        """Processes a raw 2x2 grid into a standardized 64x64 frame sheet."""
        if not self.scale_factor:
            raise ValueError("Scale factor not calculated. Run calculate_master_scale first.")
            
        img = Image.open(input_path).convert("RGBA")
        qw, qh = img.width // 2, img.height // 2
        
        final_sheet = Image.new("RGBA", (self.frame_size * 2, self.frame_size * 2), self.chroma_key + (255,))
        
        for r in range(2):
            for c in range(2):
                quad = img.crop((c*qw, r*qh, (c+1)*qw, (r+1)*qh))
                bbox = quad.getbbox()
                if bbox:
                    odin = quad.crop(bbox)
                    if mirror:
                        odin = ImageOps.mirror(odin)
                    
                    new_size = (int(odin.width * self.scale_factor), int(odin.height * self.scale_factor))
                    odin_res = odin.resize(new_size, Image.Resampling.LANCZOS)
                    
                    px = c * self.frame_size + (self.frame_size - odin_res.width) // 2
                    py = r * self.frame_size + (self.frame_size - odin_res.height) // 2
                    final_sheet.paste(odin_res, (px, py))
        
        final_sheet.convert("RGB").save(output_path)
        
        # Export Metadata (LibreSprite Style)
        meta_path = output_path.replace(".png", ".json")
        metadata = {
            "frames": {
                f"frame_{i}": {"frame": {"x": (i%2)*self.frame_size, "y": (i//2)*self.frame_size, "w": self.frame_size, "h": self.frame_size}}
                for i in range(4)
            },
            "meta": {"app": "SpriteForge", "version": "1.0", "size": {"w": self.frame_size*2, "h": self.frame_size*2}}
        }
        with open(meta_path, "w") as f:
            json.dump(metadata, f, indent=4)
            
        print(f"[SpriteForge] Forged: {output_path}")

if __name__ == "__main__":
    # Example usage for the current Odin set
    forge = SpriteForge()
    base = "/Users/jnewman/.gemini/antigravity/brain/363f1642-d3f7-49a0-a26a-f53d97c1f464/"
    out = "/Users/jnewman/.gemini/antigravity/scratch/CozyOdin/project/assets/sprites/player/"
    
    raws = [
        os.path.join(base, "odin_walk_south_sheet_1776525702100.png"),
        os.path.join(base, "odin_walk_north_raw_1776526724134.png"),
        os.path.join(base, "odin_walk_east_raw_1776526747234.png"),
        os.path.join(base, "odin_walk_west_raw_1776526771827.png")
    ]
    
    forge.calculate_master_scale(raws)
    forge.forge_sheet(raws[0], os.path.join(out, "odin_walk_south.png"))
    forge.forge_sheet(raws[1], os.path.join(out, "odin_walk_north.png"))
    forge.forge_sheet(raws[2], os.path.join(out, "odin_walk_east.png"))
    forge.forge_sheet(raws[3], os.path.join(out, "odin_walk_west.png"), mirror=True)

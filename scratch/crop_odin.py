from PIL import Image
import os

def crop_spritesheet(path, output_path):
    img = Image.open(path).convert("RGB")
    pixels = img.load()
    width, height = img.size
    
    # Target color: Magenta (255, 0, 255)
    target = (255, 0, 255)
    
    # Find bounding box of anything NOT magenta (with some tolerance)
    left, top, right, bottom = width, height, 0, 0
    found = False
    
    for y in range(height):
        for x in range(width):
            r, g, b = pixels[x, y]
            # If NOT bright pink
            if not (r > 200 and g < 50 and b > 200):
                left = min(left, x)
                top = min(top, y)
                right = max(right, x)
                bottom = max(bottom, y)
                found = True
    
    if not found:
        print("No sprites found!")
        return

    # Add a tiny bit of padding or just use the box
    # Let's see how big the box is
    box_w = right - left + 1
    box_h = bottom - top + 1
    print(f"Sprite box found: {left},{top} to {right},{bottom} ({box_w}x{box_h})")
    
    # We want a 2x2 grid. Let's assume the AI put them close together.
    # We'll crop a square that fits them.
    size = max(box_w, box_h)
    # Ensure it's even for 2x2
    if size % 2 != 0: size += 1
    
    # Center the crop
    center_x = (left + right) // 2
    center_y = (top + bottom) // 2
    
    final_left = center_x - (size // 2)
    final_top = center_y - (size // 2)
    final_right = final_left + size
    final_bottom = final_top + size
    
    cropped = img.crop((final_left, final_top, final_right, final_bottom))
    
    # Resize to exactly 64x64 (32x32 per frame)
    cropped = cropped.resize((64, 64), Image.NEAREST)
    
    cropped.save(output_path)
    print(f"Saved cropped sheet to {output_path}")

if __name__ == "__main__":
    src = "project/assets/sprites/player/odin_walk_south.png"
    crop_spritesheet(src, src)

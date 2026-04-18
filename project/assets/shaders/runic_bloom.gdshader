shader_type canvas_item;

uniform sampler2D mask_texture;
uniform float progress : hint_range(0.0, 1.0) = 0.0;
uniform float bloom_intensity : hint_range(0.0, 2.0) = 1.0;
uniform vec4 base_color : source_color = vec4(1.0, 0.84, 0.0, 1.0); // Gold

void fragment() {
    vec2 uv = UV;
    float mask = texture(mask_texture, uv).r;
    
    // 1. Calculate the Threshold Wipe
    // As progress increases, more of the mask becomes visible
    float threshold = 1.0 - progress;
    float alpha = smoothstep(threshold - 0.1, threshold + 0.1, mask);
    
    // 2. Create the Rainbow Spectrum
    float hue = fract(TIME * 0.2 + uv.x + uv.y);
    vec3 rainbow = 0.5 + 0.5 * cos(6.28318 * (vec3(0.0, 0.33, 0.67) + hue));
    
    // 3. Mix Gold and Rainbow based on progress
    vec3 final_color = mix(base_color.rgb, rainbow, progress * 0.5);
    
    // 4. Apply Bloom / Glow
    float glow = mask * bloom_intensity * progress;
    
    COLOR = vec4(final_color, alpha * progress);
}

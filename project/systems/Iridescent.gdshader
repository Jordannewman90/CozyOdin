shader_type canvas_item;

uniform float speed : hint_range(0.1, 5.0) = 1.0;
uniform float intensity : hint_range(0.0, 1.0) = 0.5;
uniform float holographic_strength : hint_range(0.0, 1.0) = 0.3;
uniform float stamina_pct : hint_range(0.0, 1.0) = 1.0; // Fades to gray as this drops

void fragment() {
	vec4 tex_color = texture(TEXTURE, UV);
	
	// MASK LOGIC: 
	// For placeholders, we treat anything 'blue-ish' as magical armor.
	// For final art, we'll use a specific color key.
	float magic_mask = 0.0;
	if (tex_color.b > 0.4 && tex_color.r < 0.6) {
		magic_mask = 1.0;
	}
	
	// Create a shifting rainbow gradient based on time and stamina speed
	float current_speed = speed * stamina_pct;
	float shift = TIME * current_speed;
	vec3 rainbow;
	rainbow.r = 0.5 + 0.5 * cos(shift + UV.y + 0.0);
	rainbow.g = 0.5 + 0.5 * cos(shift + UV.y + 2.0);
	rainbow.b = 0.5 + 0.5 * cos(shift + UV.y + 4.0);
	
	// Desaturate the rainbow as stamina drops
	vec3 gray_rainbow = vec3(dot(rainbow, vec3(0.299, 0.587, 0.114)));
	vec3 dynamic_rainbow = mix(gray_rainbow, rainbow, stamina_pct);
	
	// Final Color Logic:
	// If it's magic armor, use the dynamic rainbow.
	// If it's non-magic (beard/eyes), use the original texture.
	vec3 final_color = tex_color.rgb;
	if (magic_mask > 0.5) {
		final_color = mix(tex_color.rgb, dynamic_rainbow, intensity * stamina_pct);
	}
	
	// Add a "holographic" glimmer effect (only on magic parts)
	float scanline = sin(UV.y * 20.0 + TIME * (5.0 * stamina_pct)) * 0.1;
	final_color += vec3(scanline) * holographic_strength * magic_mask * stamina_pct;

	COLOR = vec4(final_color, tex_color.a);
}

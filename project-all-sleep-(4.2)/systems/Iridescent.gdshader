shader_type canvas_item;

uniform float speed : hint_range(0.1, 5.0) = 1.0;
uniform float intensity : hint_range(0.0, 1.0) = 0.5;
uniform float holographic_strength : hint_range(0.0, 1.0) = 0.3;

void fragment() {
	vec4 tex_color = texture(TEXTURE, UV);
	
	// Create a shifting rainbow gradient based on time
	float shift = TIME * speed;
	vec3 rainbow;
	rainbow.r = 0.5 + 0.5 * cos(shift + UV.y + 0.0);
	rainbow.g = 0.5 + 0.5 * cos(shift + UV.y + 2.0);
	rainbow.b = 0.5 + 0.5 * cos(shift + UV.y + 4.0);
	
	// Blend the rainbow with the original texture
	// We only apply it where the texture is not transparent
	vec3 final_color = mix(tex_color.rgb, rainbow, intensity * tex_color.a);
	
	// Add a "holographic" vertical scanline/glimmer effect
	float scanline = sin(UV.y * 20.0 + TIME * 10.0) * 0.1;
	final_color += vec3(scanline) * holographic_strength * tex_color.a;

	COLOR = vec4(final_color, tex_color.a);
}

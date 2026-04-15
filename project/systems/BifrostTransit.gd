extends Area2D

@export_file("*.tscn") var target_scene: String
@export var portal_color: Color = Color(0, 1, 1, 1)

func _ready():
	# Apply iridescent shader to the portal
	var mat = ShaderMaterial.new()
	mat.shader = load("res://systems/Iridescent.gdshader")
	mat.set_shader_parameter("intensity", 0.8)
	mat.set_shader_parameter("speed", 3.0)
	$ColorRect.material = mat
	$ColorRect.color = portal_color

func _on_body_entered(body):
	if body.is_in_group("player"):
		print("Bifrost activating: Warping to ", target_scene)
		# Save game before realm transition
		SaveManager.game_data["player_pos"] = {"x": 320, "y": 180} # Reset pos for the new realm
		SaveManager.save_game()
		
		get_tree().change_scene_to_file(target_scene)

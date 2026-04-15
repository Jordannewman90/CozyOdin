extends Node2D

@export var resource_name: String = "Star-Iron"
@export var health: int = 1

func _ready():
	# Give it a slight iridescent glow via the shared shader
	var mat = ShaderMaterial.new()
	mat.shader = load("res://systems/Iridescent.gdshader")
	mat.set_shader_parameter("intensity", 0.3)
	$Sprite2D.material = mat

func harvest():
	health -= 1
	if health <= 0:
		spawn_sparks()
		_add_to_vault()
		queue_free()

func simulated_harvest(amount: int):
	# Used by Proxies during offline catch-up
	for i in range(amount):
		_add_to_vault()
	# In a real game, we might mark the node as 'depleted' here

func _add_to_vault():
	if SaveManager.game_data.inventory.vault.has(resource_name):
		SaveManager.game_data.inventory.vault[resource_name] += 1
	else:
		SaveManager.game_data.inventory.vault[resource_name] = 1

func spawn_sparks():
	var sparks = load("res://entities/resources/DivineSpark.tscn").instantiate()
	sparks.global_position = global_position
	get_parent().add_child(sparks)
	sparks.emitting = true

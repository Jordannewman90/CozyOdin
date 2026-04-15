extends CharacterBody2D

enum Context { NONE, DWARVEN, ELVEN }

@export var current_context: Context = Context.NONE
@export var is_buggy: bool = false

@onready var sprite = $Sprite2D
@onready var context_overlay = $ContextOverlay

func _ready():
	add_to_group("proxy")
	apply_visual_context()
	
	# Connect to the TimeEngine for offline catch-up
	TimeEngine.offline_calculation_complete.connect(_on_offline_catch_up)
	
	# Apply the shared iridescent shader to the proxy as well
	var mat = ShaderMaterial.new()
	mat.shader = load("res://systems/Iridescent.gdshader")
	mat.set_shader_parameter("intensity", 0.3)
	sprite.material = mat

func _on_offline_catch_up(duration: float):
	if is_buggy:
		return

	# Logic: 1 resource every 5 minutes (300s), multiplied by Economic yield
	var base_harvest = duration / 300.0
	var final_yield = int(base_harvest * EconomyManager.yield_modifier)
	
	if final_yield > 0:
		var target = find_nearest_node()
		if target:
			target.simulated_harvest(final_yield)
			print("Proxy [", name, "] harvested ", final_yield, " resources while you were away (Mod: ", EconomyManager.yield_modifier, "x)")

func find_nearest_node() -> Node2D:
	var nodes = get_tree().get_nodes_in_group("harvestable")
	var nearest_node = null
	var min_dist = 999999.0
	
	for node in nodes:
		var dist = global_position.distance_to(node.global_position)
		if dist < min_dist:
			min_dist = dist
			nearest_node = node
	
	return nearest_node

func apply_visual_context():
	match current_context:
		Context.NONE:
			context_overlay.visible = false
		Context.DWARVEN:
			context_overlay.visible = true
			context_overlay.modulate = Color(0.8, 0.4, 0.2)
		Context.ELVEN:
			context_overlay.visible = true
			context_overlay.modulate = Color(0.2, 0.8, 0.4)
	
	if is_buggy:
		sprite.modulate = Color(1, 0.5, 0.5)

func _process(_delta):
	if is_buggy:
		sprite.position = Vector2(randf_range(-1, 1), randf_range(-1, 1))
	else:
		sprite.position = Vector2.ZERO

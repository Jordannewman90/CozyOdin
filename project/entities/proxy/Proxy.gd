extends CharacterBody2D

enum Context { NONE, DWARVEN, ELVEN }

@export var current_context: Context = Context.NONE
@export var efficiency: float = 1.0

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
	# Minimum efficiency 0.1, max 1.0
	var final_efficiency = clamp(efficiency, 0.1, 1.0)

	# Logic: 1 resource every 5 minutes (300s), multiplied by Economic yield AND Proxy efficiency
	var base_harvest = duration / 300.0
	var final_yield = int(base_harvest * EconomyManager.yield_modifier * final_efficiency)
	
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
	
	# Tier-based visuals
	if efficiency > 0.95:
		# Divine Sync: Strong iridescent pulse (handled in shader intensity later)
		sprite.modulate = Color(1.2, 1.2, 1.2) # Overbright
	elif efficiency > 0.7:
		# Stable: Standard gold/white tint
		sprite.modulate = Color(1, 1, 0.9)
	elif efficiency < 0.4:
		# Clumsy: Subtle red tint (not as aggressive as buggy)
		sprite.modulate = Color(1, 0.8, 0.8)
	else:
		sprite.modulate = Color.WHITE

func _process(_delta):
	# No more twitching. 
	# Future: Could add a 'clumsy' animation state here.
	sprite.position = Vector2.ZERO

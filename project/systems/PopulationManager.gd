extends Node2D

class_name PopulationManager

@export var citizen_scene: PackedScene
@export var realm_name: String = "asgard" # "asgard", "nidavellir", "alfheim"

var current_citizens: Array = []
var target_count: int = 0

func _ready():
	# Initially calculate population
	update_population(get_current_chaos())
	
	# Connect to chaos changed signals if they exist
	# (In a real scenario, we'd listen to a Global Signal or RealmManager)
	
	# For now, let's poll every 5 seconds or wait for updates
	var timer = Timer.new()
	timer.wait_time = 5.0
	timer.autostart = true
	timer.timeout.connect(_on_check_timer_timeout)
	add_child(timer)

func _on_check_timer_timeout():
	update_population(get_current_chaos())

func get_current_chaos() -> float:
	# Placeholder for getting actual chaos from the realm
	# In Asgard, it's always 0. In others, we'd check the Realm data.
	if realm_name == "asgard": return 0.0
	
	# Fallback/Mock: Get chaos from parent if it has it
	if get_parent().has_method("get_chaos_level"):
		return get_parent().get_chaos_level()
		
	return 0.0

func update_population(chaos_pct: float):
	# Map Chaos % to Population Count (from PRD)
	if chaos_pct <= 10.0:
		target_count = randi_range(5, 8)
	elif chaos_pct <= 40.0:
		target_count = randi_range(2, 3)
	elif chaos_pct <= 70.0:
		target_count = 1
	else:
		target_count = 0
		
	_adjust_citizens()

func _adjust_citizens():
	# Remove excess citizens
	while current_citizens.size() > target_count:
		var c = current_citizens.pop_back()
		if is_instance_valid(c):
			c.queue_free()
			
	# Add missing citizens
	while current_citizens.size() < target_count:
		_spawn_citizen()

func _spawn_citizen():
	if not citizen_scene:
		push_warning("PopulationManager: No citizen_scene assigned!")
		return
		
	var c = citizen_scene.instantiate()
	add_child(c)
	current_citizens.append(c)
	
	# Set type based on realm
	if realm_name == "nidavellir": c.citizen_type = "dwarf"
	elif realm_name == "alfheim": c.citizen_type = "elf"
	else: c.citizen_type = "asgard"
	
	# Pick random position within a reasonable range
	# (In a final build, we'd use NavigationServer to find walkable points)
	c.global_position = global_position + Vector2(randf_range(-200, 200), randf_range(-200, 200))

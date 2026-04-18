extends CharacterBody2D

@export var move_speed: float = 150.0
@export var max_stamina: float = 100.0

var current_stamina: float = 100.0
var trail_timer: float = 0.0
var trail_frequency: float = 0.05

@onready var sprite = $Sprite2D
@onready var interaction_area = $InteractionArea

func _ready():
	add_to_group("player")
	
	# Restore position from last save
	var pos = SaveManager.game_data.get("player_pos", {"x": 320, "y": 180})
	global_position = Vector2(pos.x, pos.y)

	# Apply Iridescent Shader
	var shader = load("res://systems/Iridescent.gdshader")
	var mat = ShaderMaterial.new()
	mat.shader = shader
	mat.set_shader_parameter("intensity", 0.4)
	mat.set_shader_parameter("speed", 2.0)
	sprite.material = mat

func _unhandled_input(event):
	if event.is_action_pressed("interact"):
		var targets = interaction_area.get_overlapping_areas()
		for target in targets:
			if target.is_in_group("harvestable"):
				target.harvest()
				return
			elif target.is_in_group("proxy"):
				# Pick up the Proxy
				if SaveManager.game_data.squad.size() < 3:
					var data = {
						"id": target.name,
						"efficiency": target.efficiency,
						"current_context": target.current_context
					}
					SaveManager.game_data.squad.append(data)
					target.queue_free()
					print("Proxy Squad: ", SaveManager.game_data.squad.size(), "/3")
					return

	if event.is_action_pressed("deploy"):
		if SaveManager.game_data.squad.size() > 0:
			var data = SaveManager.game_data.squad.pop_back()
			var proxy_scene = load("res://entities/proxy/Proxy.tscn")
			var new_proxy = proxy_scene.instantiate()
			
			# Restore state
			new_proxy.efficiency = data.get("efficiency", 1.0)
			new_proxy.current_context = data["current_context"]
			new_proxy.global_position = global_position + Vector2(20, 0) # Offset slightly
			
			get_parent().add_child(new_proxy)
			print("Proxy Deployed! Efficiency: ", new_proxy.efficiency)

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction != Vector2.ZERO:
		velocity = direction * move_speed
		if direction.x != 0:
			sprite.flip_h = direction.x < 0
		
		# Handle Ghost Trail
		trail_timer += delta
		if trail_timer >= trail_frequency:
			spawn_ghost_trail()
			trail_timer = 0
	else:
		velocity = velocity.move_toward(Vector2.ZERO, move_speed)
		trail_timer = 0

	move_and_slide()
	
	# Update Iridescent Shader based on stamina
	if sprite.material:
		var pct = current_stamina / max_stamina
		sprite.material.set_shader_parameter("stamina_pct", pct)

func spawn_ghost_trail():
	var ghost = Sprite2D.new()
	ghost.texture = sprite.texture
	ghost.global_position = global_position
	ghost.flip_h = sprite.flip_h
	ghost.scale = sprite.scale
	ghost.material = sprite.material
	ghost.set_script(load("res://entities/player/GhostTrail.gd"))
	get_parent().add_child(ghost)

func consume_stamina(amount: float):
	current_stamina = max(0, current_stamina - amount)

func restore_stamina(amount: float):
	current_stamina = min(max_stamina, current_stamina + amount)

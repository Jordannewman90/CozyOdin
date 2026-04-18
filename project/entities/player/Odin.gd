extends CharacterBody2D

@export var move_speed: float = 150.0
@export var max_stamina: float = 100.0

var current_stamina: float = 100.0

@onready var sprite = $Sprite2D
@onready var interaction_area = $InteractionArea
@onready var anim_player = $AnimationPlayer

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
	else:
		velocity = velocity.move_toward(Vector2.ZERO, move_speed * 10.0 * delta)
	
	if velocity.length() > 5.0:
		var anim_to_play = "walk_down"
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				anim_to_play = "walk_east"
			else:
				anim_to_play = "walk_west"
		else:
			if direction.y > 0:
				anim_to_play = "walk_down"
			else:
				anim_to_play = "walk_up"
		
		if not anim_player.is_playing() or anim_player.current_animation != anim_to_play:
			anim_player.play(anim_to_play)
	else:
		anim_player.stop()
		sprite.frame = 0 # Force idle frame
		if direction == Vector2.ZERO:
			velocity = Vector2.ZERO

	move_and_slide()

func consume_stamina(amount: float):
	current_stamina = max(0, current_stamina - amount)

func restore_stamina(amount: float):
	current_stamina = min(max_stamina, current_stamina + amount)

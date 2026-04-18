extends CanvasLayer

# BifrostTransition.gd
# Handles the randomized rainbow and golden transition between scenes.

signal transition_finished

@onready var particles = $CPUParticles2D
@onready var color_rect = $ColorRect
@onready var anim_player = $AnimationPlayer

func _ready():
	# Hide by default
	color_rect.modulate.a = 0
	particles.emitting = false

func start_transition():
	randomize()
	
	# 1. Randomize Particle Properties for a unique "Bifrost" feel
	particles.amount = randi_range(50, 150)
	particles.direction = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0))
	particles.spread = randf_range(45, 180)
	particles.gravity = Vector2(0, randf_range(-50, 50))
	particles.initial_velocity_min = randf_range(100, 300)
	particles.initial_velocity_max = randf_range(400, 800)
	
	# 2. Randomize the "Rainbow/Gold" mix
	var base_color = Color(1.0, randf(), randf()) # Randomized rainbow base
	if randf() > 0.5:
		base_color = Color(1.0, 0.84, 0.0) # 50% chance of a Golden Surge
	
	particles.color = base_color
	
	# 3. Play the animation
	particles.emitting = true
	anim_player.play("fade_in_out")

func _on_animation_finished(anim_name):
	if anim_name == "fade_in_out":
		emit_signal("transition_finished")
		particles.emitting = false

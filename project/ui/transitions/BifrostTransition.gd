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
	particles.amount = randi_range(800, 1500)
	particles.initial_velocity_min = randf_range(400, 600)
	particles.initial_velocity_max = randf_range(1000, 1500)
	
	# 2. Randomize the "Rainbow/Gold" mix
	var base_color = Color(1.0, randf(), randf()) 
	if randf() > 0.4:
		base_color = Color(1.0, 0.84, 0.0) # 60% chance of a Golden Surge
	
	particles.color = base_color
	
	# 3. Trigger Screen Shake (Visual only)
	_apply_shake()
	
	# 4. Play the animation
	particles.emitting = true
	anim_player.play("fade_in_out")

func _apply_shake():
	var shake_tween = create_tween()
	for i in range(15):
		var offset = Vector2(randf_range(-20, 20), randf_range(-20, 20))
		shake_tween.tween_property(color_rect, "position", offset, 0.05)
	shake_tween.tween_property(color_rect, "position", Vector2.ZERO, 0.05)

func _on_animation_finished(anim_name):
	if anim_name == "fade_in_out":
		emit_signal("transition_finished")
		particles.emitting = false

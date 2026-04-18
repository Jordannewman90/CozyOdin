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
	
	# 2. Randomize Intensity and Velocity for the surge
	particles.amount = randi_range(1200, 2000)
	particles.initial_velocity_min = randf_range(600, 800)
	particles.initial_velocity_max = randf_range(1500, 2500)
	
	# We use the ColorRamp Gradient from the scene now for a TRUE rainbow
	
	# 3. Trigger Screen Shake (Visual only)
	_apply_shake()
	
	# 4. Play the animation
	particles.emitting = true
	anim_player.play("fade_in_out")

func _apply_shake():
	var shake_tween = create_tween()
	for i in range(15):
		var shake_offset = Vector2(randf_range(-20, 20), randf_range(-20, 20))
		shake_tween.tween_property(color_rect, "position", shake_offset, 0.05)
	shake_tween.tween_property(color_rect, "position", Vector2.ZERO, 0.05)

func _on_animation_finished(anim_name):
	if anim_name == "fade_in_out":
		emit_signal("transition_finished")
		particles.emitting = false

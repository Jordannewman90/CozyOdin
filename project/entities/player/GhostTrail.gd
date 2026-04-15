extends Sprite2D

func _ready():
	# Create a simple fade out and delete animation
	var tween = create_tween()
	
	# Set start properties
	modulate.a = 0.6
	
	# Transition: Fade to 0 and scale up slightly
	tween.set_parallel(true)
	tween.tween_property(self, "modulate:a", 0.0, 0.4).set_trans(Tween.TRANS_QUART)
	tween.tween_property(self, "scale", scale * 1.1, 0.4).set_trans(Tween.TRANS_QUART)
	
	# Delete when finished
	tween.set_parallel(false)
	tween.tween_callback(queue_free)

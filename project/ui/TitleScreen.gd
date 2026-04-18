extends Control

# TitleScreen.gd
# Handles the intro sequence and transition to the game.

@onready var press_start_label = $PressStart
@onready var anim_player = $AnimationPlayer

func _ready():
	# Start the blinking animation
	if anim_player.has_animation("blink_start"):
		anim_player.play("blink_start")
	
	# Ensure the game isn't paused
	get_tree().paused = false

func _input(event):
	# Transition on any major input
	if event.is_action_pressed("ui_accept") or (event is InputEventMouseButton and event.pressed):
		_start_game()

func _start_game():
	print("Bifrost engaged. Entering Asgard...")
	# Play a "Flash" or "Bifrost Beam" effect here in the future
	get_tree().change_scene_to_file("res://levels/asgard/Asgard.tscn")

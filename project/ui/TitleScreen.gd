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

const BIFROST_TRANSITION = preload("res://ui/transitions/BifrostTransition.tscn")

func _on_continue_pressed():
	_start_game()

func _input(event):
	# Transition on any major input
	if event.is_action_pressed("ui_accept") or (event is InputEventMouseButton and event.pressed):
		_start_game()

func _start_game():
	print("Bifrost engaged. Entering Asgard...")
	
	# Instantiate and play the randomized transition
	var transition = BIFROST_TRANSITION.instantiate()
	add_child(transition)
	transition.start_transition()
	
	# Wait for the "White Out" peak (now at 1.5s for the 3s surge)
	await get_tree().create_timer(1.5).timeout
	
	# Check if we need to show the Raven Dashboard
	var showed_dashboard = SaveManager.handle_offline_time()
	
	if showed_dashboard:
		# Wait for the dashboard to be closed before proceeding
		# We'll listen for the "Continue" signal or just check the dashboard instance
		# For now, we'll proceed to the scene but keep it paused
		get_tree().change_scene_to_file("res://levels/asgard/Asgard.tscn")
	else:
		get_tree().change_scene_to_file("res://levels/asgard/Asgard.tscn")

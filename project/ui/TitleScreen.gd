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
var is_starting = false

func _on_continue_pressed():
	_start_game()

func _input(event):
	# Transition on any major input
	if event.is_action_pressed("ui_accept") or (event is InputEventMouseButton and event.pressed):
		_start_game()

func _start_game():
	if is_starting:
		return
	is_starting = true
	
	print("Bifrost engaged. Entering Asgard...")
	
	# Instantiate and play the randomized transition
	var transition = BIFROST_TRANSITION.instantiate()
	# Add to root so it persists across the scene change
	get_tree().root.add_child(transition)
	transition.start_transition()
	
	# Wait for the "White Out" peak (now at 2.5s for the 4.5s surge)
	await get_tree().create_timer(2.5).timeout
	
	# Check if we need to show the Raven Dashboard
	var showed_dashboard = SaveManager.handle_offline_time()
	
	if showed_dashboard:
		# Find the dashboard in the root (it was added via call_deferred in SaveManager)
		# We'll wait a frame to ensure it's there, then wait for its signal
		await get_tree().process_frame
		var dashboard = get_tree().root.get_node_or_null("RavenDashboard")
		if dashboard:
			await dashboard.dashboard_closed
		
		get_tree().change_scene_to_file("res://levels/asgard/Asgard.tscn")
	else:
		get_tree().change_scene_to_file("res://levels/asgard/Asgard.tscn")

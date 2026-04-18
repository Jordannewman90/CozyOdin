extends Control

@onready var stamina_bar = $StaminaBar
@onready var offline_label = $OfflineLabel
@onready var sleep_button = $SleepButton
@onready var open_bezel_button = $OpenBezelButton
@onready var squad_label = $SquadLabel
@onready var moot_label = $MootLabel
@onready var crisis_banner = $CrisisBanner
@onready var fade_overlay = $FadeOverlay

func _ready():
	# Connect to the TimeEngine signal
	TimeEngine.offline_calculation_complete.connect(_on_offline_time_calculated)
	
	# Connect to Economy signals
	EconomyManager.crisis_started.connect(_on_crisis_started)
	
	# Connect buttons
	sleep_button.pressed.connect(_on_sleep_pressed)
	open_bezel_button.pressed.connect(_on_open_bezel_pressed)
	
	sleep_button.focus_mode = Control.FOCUS_NONE
	open_bezel_button.focus_mode = Control.FOCUS_NONE
	
	# Hide the label and overlay initially
	offline_label.modulate.a = 0
	fade_overlay.color.a = 0
	fade_overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE
	crisis_banner.visible = false

func _process(_delta):
	# Refresh squad counter
	squad_label.text = "SQUAD: " + str(SaveManager.game_data.squad.size()) + "/3"
	
	# Refresh Moot timer
	var time_left = EconomyManager.get_time_to_next_moot()
	moot_label.text = "NEXT MOOT: " + format_time(float(time_left))

func _on_crisis_started(crisis_name: String, _modifier: float):
	crisis_banner.visible = true
	crisis_banner.get_node("Label").text = "!!! DIPLOMATIC CRISIS: " + crisis_name.to_upper() + " !!!"
	
	# Auto-hide after 10 seconds of visual alert
	await get_tree().create_timer(10.0).timeout
	var tween = create_tween()
	tween.tween_property(crisis_banner, "modulate:a", 0.0, 2.0)
	tween.tween_callback(func(): crisis_banner.visible = false; crisis_banner.modulate.a = 1.0)
func _on_open_bezel_pressed():
	# Prevent opening multiple bezels
	if get_node_or_null("AlignmentBezel"):
		return
		
	open_bezel_button.release_focus() # Prevent spacebar from re-triggering the button
	var bezel = load("res://ui/alignment_bezel/AlignmentBezel.tscn").instantiate()
	bezel.name = "AlignmentBezel" # Set name for the guard check
	add_child(bezel)
	bezel.configuration_locked.connect(_on_bezel_configuration_locked)

func _on_bezel_configuration_locked(results: Dictionary):
	print("New Proxy Configuration Locked: ", results)
	var proxy = get_tree().get_nodes_in_group("proxy")[0] if get_tree().get_nodes_in_group("proxy").size() > 0 else null
	if proxy:
		proxy.efficiency = results["alignment_efficiency"]
		if results["context"] == "Dwarven":
			proxy.current_context = proxy.Context.DWARVEN
		else:
			proxy.current_context = proxy.Context.ELVEN
		proxy.apply_visual_context()

func _on_offline_time_calculated(duration: float):
	if duration <= 1:
		return

	offline_label.text = "You have been asleep for: " + format_time(duration)
	var tween = create_tween()
	tween.tween_property(offline_label, "modulate:a", 1.0, 1.5).set_trans(Tween.TRANS_SINE)

func _on_sleep_pressed():
	sleep_button.disabled = true
	var tween = create_tween()
	fade_overlay.mouse_filter = Control.MOUSE_FILTER_STOP
	tween.tween_property(fade_overlay, "color:a", 1.0, 2.0).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(func():
		var odin = get_tree().get_first_node_in_group("player")
		if odin:
			SaveManager.game_data["player_pos"] = {"x": odin.global_position.x, "y": odin.global_position.y}
		SaveManager.save_and_quit()
	)

func format_time(total_seconds: float) -> String:
	var hours = int(total_seconds / 3600)
	var minutes = int(fmod(total_seconds, 3600) / 60)
	var seconds = int(fmod(total_seconds, 60))
	var time_string = ""
	if hours > 0: time_string += str(hours) + "h "
	if minutes > 0 or hours > 0: time_string += str(minutes) + "m "
	time_string += str(seconds) + "s"
	return time_string

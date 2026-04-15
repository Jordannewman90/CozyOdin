extends Node

signal offline_calculation_complete(duration_seconds: float)

var offline_duration: float = 0.0

func _ready():
	# Wait one frame for SaveManager to load its data
	await get_tree().process_frame
	calculate_offline_time()

func calculate_offline_time():
	var start_time = SaveManager.game_data.get("offline_start_time", 0)
	
	if start_time == 0:
		print("First run: No offline time to calculate.")
		return

	var current_time = Time.get_unix_time_from_system()
	offline_duration = current_time - start_time
	
	if offline_duration < 0:
		print("System clock anomaly detected (Negative time). Skipping simulation.")
		offline_duration = 0.0
	elif offline_duration > 604800: # 7-day cap
		print("Offline duration capped at 7 days.")
		offline_duration = 604800.0
	
	print("Welcome back, Odin. You've been asleep for: ", offline_duration, " seconds.")
	
	# Emit signal so other systems (Proxies, Chaos) can react
	offline_calculation_complete.emit(offline_duration)

func get_simulation_ticks(seconds_per_tick: float = 60.0) -> int:
	return int(offline_duration / seconds_per_tick)

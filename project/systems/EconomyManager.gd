extends Node

signal crisis_started(crisis_name: String, modifier: float)

var active_crisis_name: String = "Normal"
var yield_modifier: float = 1.0

# Pool of diplomatic crises
var crises = [
	{"name": "Dwarven Surge", "modifier": 1.5, "desc": "Market demand for Star-Iron has spiked!"},
	{"name": "Elven Embargo", "modifier": 0.5, "desc": "Trade routes are blocked; efficiency reduced."},
	{"name": "Mana Bloom", "modifier": 2.0, "desc": "Divine energy is surging; massive yield bonus!"},
	{"name": "Mana Drought", "modifier": 0.3, "desc": "The forest is lethargic; Alfheim yields are crashing."},
	{"name": "Lush Bloom", "modifier": 1.8, "desc": "Alfheim is thriving; Mana-Sap is overflowing!"}
]

var moot_interval: int = 86400 # 24 hours

func _ready():
	# Wait for TimeEngine to calculate offline duration
	TimeEngine.offline_calculation_complete.connect(_on_offline_calc_done)

func _on_offline_calc_done(_duration: float):
	update_economy_state()

func update_economy_state():
	var current_time = Time.get_unix_time_from_system()
	var last_save_time = SaveManager.game_data.get("timestamp", 0)
	
	# If a Moot period has passed, trigger a new crisis
	if (current_time - last_save_time) > moot_interval:
		trigger_random_crisis()
	else:
		# Keep normal state for now
		active_crisis_name = "Stability"
		yield_modifier = 1.0

func trigger_random_crisis():
	var crisis = crises[randi() % crises.size()]
	active_crisis_name = crisis["name"]
	yield_modifier = crisis["modifier"]
	crisis_started.emit(active_crisis_name, yield_modifier)
	print("!!! ECONOMY ALERT: ", active_crisis_name, " (", yield_modifier, "x Yield) !!!")

func get_time_to_next_moot() -> int:
	var last_moot = SaveManager.game_data.get("timestamp", 0)
	var next_moot = last_moot + moot_interval
	var time_left = next_moot - Time.get_unix_time_from_system()
	return max(0, int(time_left))

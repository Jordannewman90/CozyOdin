extends Node

const SAVE_PATH = "user://save_data.json"

var game_data = {
	"resources": {"divine_sparks": 0},
	"inventory": {
		"vault": {"Star-Iron": 0}
	},
	"timestamp": 0,
	"realm_states": {
		"asgard": {"chaos": 0},
		"nidavellir": {"chaos": 0},
		"alfheim": {"chaos": 0}
	},
	"player_pos": {"x": 320, "y": 180},
	"proxies": [],
	"squad": []
}

func register_proxy(proxy_id: String, position: Vector2, realm: String):
	var new_proxy = {
		"id": proxy_id,
		"pos": {"x": position.x, "y": position.y},
		"realm": realm,
		"efficiency": 1.0
	}
	game_data["proxies"].append(new_proxy)

func _ready():
	load_game()
	_handle_offline_time()

func _handle_offline_time():
	var last_time = game_data.get("timestamp", 0)
	if last_time == 0:
		return # First run
		
	var current_time = Time.get_unix_time_from_system()
	var offline_seconds = current_time - last_time
	
	if offline_seconds < 60: 
		return # Too short for a report
		
	# 1. Simulate Gains
	# Each proxy earns 1 resource per hour (3600s)
	var proxies = game_data.get("proxies", [])
	var total_earned = int((offline_seconds / 3600.0) * proxies.size())
	
	# Add to vault
	var current_vault = game_data["inventory"]["vault"].get("Star-Iron", 0)
	game_data["inventory"]["vault"]["Star-Iron"] = current_vault + total_earned
	
	# 2. Show Dashboard
	var dash_scene = load("res://ui/raven_dashboard/RavenDashboard.tscn")
	if dash_scene:
		var dash = dash_scene.instantiate()
		get_tree().root.add_child.call_deferred(dash)
		dash.setup_report(offline_seconds, total_earned, 0.0)
		
		# Pause game while dashboard is open
		get_tree().paused = true

func save_game():
	game_data["timestamp"] = Time.get_unix_time_from_system()
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		var json_string = JSON.stringify(game_data)
		file.store_string(json_string)

func load_game():
	if not FileAccess.file_exists(SAVE_PATH):
		return
		
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		var json = JSON.new()
		var error = json.parse(json_string)
		if error == OK:
			game_data = json.data

func save_and_quit():
	save_game()
	get_tree().quit()

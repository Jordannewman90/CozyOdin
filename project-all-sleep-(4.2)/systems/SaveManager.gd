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
		"efficiency": 1.0,
		"is_buggy": false
	}
	game_data["proxies"].append(new_proxy)

func _ready():
	load_game()

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

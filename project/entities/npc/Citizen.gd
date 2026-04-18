extends CharacterBody2D

class_name Citizen

@export var citizen_type: String = "asgard" # "asgard", "dwarf", "elf"
@export var speed: float = 40.0
@export var wander_radius: float = 100.0

@onready var sprite = $Sprite2D
@onready var anim = $AnimationPlayer
@onready var bark_label = $BarkLabel
@onready var bark_timer = $BarkTimer

var target_position: Vector2
var is_wandering: bool = false

var barks = {
	"asgard": [
		"Glory to the All-Father!",
		"The Bifrost looks stable today.",
		"Frigg’s gardens are blooming beautifully.",
		"Is that a raven I hear?",
		"Steady as she goes."
	],
	"dwarf": [
		"Keep the hammers swinging!",
		"The Star-Iron is pure today.",
		"Better than that deep freeze, eh?",
		"The gears are humming perfectly.",
		"Time is gold, and we're making both."
	],
	"elf": [
		"The light... it’s so warm.",
		"Nature breathes again.",
		"The vines are quiet today. Good.",
		"Do you hear the Resonance Song?",
		"A peaceful day in Alfheim."
	]
}

func _ready():
	target_position = global_position
	bark_label.hide()
	
	# Start random bark cycle
	_on_bark_timer_timeout()

func _physics_process(_delta):
	if global_position.distance_to(target_position) > 5.0:
		velocity = (target_position - global_position).normalized() * speed
		move_and_slide()
		
		# Update sprite direction
		if velocity.x > 0: sprite.flip_h = false
		elif velocity.x < 0: sprite.flip_h = true
	else:
		velocity = Vector2.ZERO
		if not is_wandering:
			_start_wander_timer()

func _start_wander_timer():
	is_wandering = true
	await get_tree().create_timer(randf_range(2.0, 5.0)).timeout
	_pick_new_target()
	is_wandering = false

func _pick_new_target():
	var random_dir = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	target_position = global_position + (random_dir * randf_range(20.0, wander_radius))

func _on_bark_timer_timeout():
	if barks.has(citizen_type):
		var list = barks[citizen_type]
		bark_label.text = list[randi() % list.size()]
		bark_label.show()
		
		# Show bark for 3 seconds then hide
		await get_tree().create_timer(3.0).timeout
		bark_label.hide()
	
	# Schedule next bark
	bark_timer.start(randf_range(10.0, 30.0))

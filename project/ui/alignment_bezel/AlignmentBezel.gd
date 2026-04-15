extends Control

signal configuration_locked(config: Dictionary)

enum State { OUTER, INNER, CENTER, COMPLETE }

var current_state = State.OUTER
var ring_speeds = {
	"outer": 45.0,
	"inner": 120.0,
	"center": 240.0
}

var results = {
	"directive": "None",
	"context": "None",
	"guardrail": "None",
	"is_buggy": false
}

@onready var outer_ring = $Rings/OuterRing
@onready var inner_ring = $Rings/InnerRing
@onready var center_bezel = $Rings/CenterBezel
@onready var status_label = $Status

func _process(delta):
	if current_state <= State.OUTER:
		outer_ring.rotation_degrees += ring_speeds["outer"] * delta
	if current_state <= State.INNER:
		inner_ring.rotation_degrees += ring_speeds["inner"] * delta
	if current_state <= State.CENTER:
		center_bezel.rotation_degrees += ring_speeds["center"] * delta

func _unhandled_input(event):
	if event.is_action_pressed("interact") or event.is_action_pressed("ui_accept"):
		lock_current_ring()

func lock_current_ring():
	match current_state:
		State.OUTER:
			if check_lock(outer_ring):
				results["directive"] = "Harvest"
				status_label.text = "OUTER: LOCKED"
			else:
				results["is_buggy"] = true
				status_label.text = "OUTER: SLIPPED!"
			current_state = State.INNER
			
		State.INNER:
			if check_lock(inner_ring):
				results["context"] = "Dwarven"
				status_label.text = "INNER: LOCKED"
			else:
				results["is_buggy"] = true
				status_label.text = "INNER: SLIPPED!"
			current_state = State.CENTER
			
		State.CENTER:
			if check_lock(center_bezel):
				results["guardrail"] = "Safe"
				status_label.text = "BEZEL: LOCKED"
			else:
				results["is_buggy"] = true
				status_label.text = "BEZEL: SLIPPED!"
			current_state = State.COMPLETE
			finalize_configuration()

func check_lock(ring: TextureRect) -> bool:
	var rot = fmod(ring.rotation_degrees, 360.0)
	if rot < 0: rot += 360.0
	var window = 15.0
	if ring == center_bezel: window = 8.0
	
	var is_perfect = rot < window or rot > (360.0 - window)
	
	if is_perfect:
		var tween = create_tween()
		tween.tween_property(ring, "rotation_degrees", 0.0, 0.1).set_trans(Tween.TRANS_BACK)
		ring.modulate = Color(0, 1, 0)
	else:
		ring.modulate = Color(1, 0, 0)
		var tween = create_tween()
		tween.tween_property(self, "position:x", position.x + 5, 0.05)
		tween.tween_property(self, "position:x", position.x - 5, 0.05)
		tween.tween_property(self, "position:x", position.x, 0.05)
		
	return is_perfect

func finalize_configuration():
	$Instructions.text = "CONFIGURATION READY. Closing..."
	await get_tree().create_timer(1.5).timeout
	configuration_locked.emit(results)
	queue_free()

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
	"alignment_efficiency": 1.0
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

var last_lock_time = 0.0

func lock_current_ring():
	if current_state == State.COMPLETE:
		return
	
	# Prevent double-taps (0.1s cooldown - shortened for responsiveness)
	var now = Time.get_ticks_msec() / 1000.0
	if now - last_lock_time < 0.1:
		return
	last_lock_time = now

	var ring_node = get_current_ring_node()
	if not ring_node:
		return
		
	var efficiency = check_lock(ring_node)
	
	match current_state:
		State.OUTER:
			print(">>> BEZEL DEBUG: Outer Ring Locked (", int(efficiency*100), "%)")
			results["directive"] = "Harvest"
			update_status_display("OUTER", efficiency)
			current_state = State.INNER
			
		State.INNER:
			print(">>> BEZEL DEBUG: Inner Ring Locked (", int(efficiency*100), "%)")
			results["context"] = "Dwarven"
			update_status_display("INNER", efficiency)
			current_state = State.CENTER
			
		State.CENTER:
			print(">>> BEZEL DEBUG: Center Bezel Locked (", int(efficiency*100), "%)")
			results["guardrail"] = "Safe"
			update_status_display("BEZEL", efficiency)
			current_state = State.COMPLETE
			finalize_configuration()

func get_current_ring_node() -> TextureRect:
	match current_state:
		State.OUTER: return outer_ring
		State.INNER: return inner_ring
		State.CENTER: return center_bezel
	return null

func update_status_display(ring_name: String, efficiency: float):
	var tier = "CLUMSY"
	if efficiency > 0.95: tier = "PERFECT"
	elif efficiency > 0.7: tier = "STABLE"
	
	status_label.text = ring_name + ": " + tier + " (" + str(int(efficiency * 100)) + "%)"

func check_lock(ring: TextureRect) -> float:
	var rot = fmod(ring.rotation_degrees, 360.0)
	if rot < 0: rot += 360.0
	
	# Calculate distance from 0 (shortest path)
	var dist = min(rot, 360.0 - rot)
	
	# Efficiency curve: 1.0 at 0 deg, 0.1 at 45+ deg
	var efficiency = clamp(1.0 - (dist / 45.0), 0.1, 1.0)
	
	# Immediate snap to clean angle (stops the visual "drift")
	var target_rot = round(ring.rotation_degrees / 360.0) * 360.0
	if dist < 15.0:
		ring.rotation_degrees = target_rot
	
	# Color feedback (Red -> Yellow -> Green)
	var target_color = Color.RED
	if efficiency > 0.8:
		target_color = Color.GREEN.lerp(Color.YELLOW, (1.0 - efficiency) / 0.2)
	elif efficiency > 0.4:
		target_color = Color.YELLOW.lerp(Color.RED, (0.8 - efficiency) / 0.4)
	
	ring.modulate = target_color
	
	# Screen shake only if really bad (< 40%)
	if efficiency < 0.4:
		var tween = create_tween()
		tween.tween_property(self, "position:x", position.x + 5, 0.05)
		tween.tween_property(self, "position:x", position.x - 5, 0.05)
		tween.tween_property(self, "position:x", position.x, 0.05)
		
	return efficiency

func finalize_configuration():
	# Calculate total efficiency (average of the three rings)
	var score1 = check_lock_silent(outer_ring)
	var score2 = check_lock_silent(inner_ring)
	var score3 = check_lock_silent(center_bezel)
	
	results["alignment_efficiency"] = (score1 + score2 + score3) / 3.0
	
	$Instructions.text = "SYNC COMPLETE: " + str(int(results["alignment_efficiency"] * 100)) + "%"
	await get_tree().create_timer(1.5).timeout
	configuration_locked.emit(results)
	queue_free()

func check_lock_silent(ring: TextureRect) -> float:
	var rot = fmod(ring.rotation_degrees, 360.0)
	if rot < 0: rot += 360.0
	var dist = min(rot, 360.0 - rot)
	return clamp(1.0 - (dist / 45.0), 0.1, 1.0)

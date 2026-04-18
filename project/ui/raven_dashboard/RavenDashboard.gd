extends CanvasLayer

class_name RavenDashboard

@onready var hugin_label = $TabletFrame/HuginText
@onready var munin_label = $TabletFrame/MuninText
@onready var time_label = $TabletFrame/TimeSleptLabel

var hugin_facts = [
	"The supply lines held firm.",
	"Resource yield was within predicted margins.",
	"Chaos escalation was successfully suppressed.",
	"The Bifrost remained synchronized.",
	"The Vault has been updated with your earnings."
]

var munin_rumors = [
	"The Elves are whispering about a green light in the woods...",
	"Frigg was seen looking at the empty spear-rack with a sigh.",
	"Brokk is grumbling about missing tools again. Loki's work?",
	"The wind in Alfheim carries a strange, mocking laughter.",
	"The realms feel... quieter without you. But they are healing."
]

var _offline_seconds: float
var _resources_earned: int
var _chaos_delta: float
var _data_set: bool = false

func setup_report(offline_seconds: float, resources_earned: int, chaos_delta: float):
	_offline_seconds = offline_seconds
	_resources_earned = resources_earned
	_chaos_delta = chaos_delta
	_data_set = true
	
	# If we are already ready, apply immediately. 
	# If not, _ready() will handle it.
	if is_inside_tree():
		_apply_report_ui()

func _ready():
	if _data_set:
		_apply_report_ui()

func _apply_report_ui():
	# 1. Format Time
	var hours = int(_offline_seconds / 3600)
	var minutes = int((int(_offline_seconds) % 3600) / 60)
	time_label.text = "You slept for %d hours and %d minutes." % [hours, minutes]
	
	# 2. Hugin (Facts)
	var fact = hugin_facts[randi() % hugin_facts.size()]
	hugin_label.text = "HUGIN: \"All-Father, you have been away. %s We secured %d materials in your absence.\"" % [fact, _resources_earned]
	
	# 3. Munin (Feeling)
	var rumor = munin_rumors[randi() % munin_rumors.size()]
	var chaos_comment = ""
	if _chaos_delta > 0:
		chaos_comment = "The world felt your absence; chaos took root in the shadows."
	else:
		chaos_comment = "Your systems held. The world was peaceful."
		
	munin_label.text = "MUNIN: \"I remember your return, All-Father. %s %s\"" % [chaos_comment, rumor]

func _on_continue_button_pressed():
	# Hide dashboard and resume game
	self.hide()
	get_tree().paused = false

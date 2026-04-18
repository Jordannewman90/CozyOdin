extends CanvasLayer

class_name RavenDashboard

@onready var hugin_label = $HuginText
@onready var munin_label = $MuninText
@onready var time_label = $TimeSleptLabel

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

func setup_report(offline_seconds: float, resources_earned: int, chaos_delta: float):
	# 1. Format Time
	var hours = int(offline_seconds / 3600)
	var minutes = int((int(offline_seconds) % 3600) / 60)
	time_label.text = "You slept for %d hours and %d minutes." % [hours, minutes]
	
	# 2. Hugin (Facts)
	var fact = hugin_facts[randi() % hugin_facts.size()]
	hugin_label.text = "HUGIN: \"All-Father, you have been away. %s We secured %d materials in your absence.\"" % [fact, resources_earned]
	
	# 3. Munin (Feeling)
	var rumor = munin_rumors[randi() % munin_rumors.size()]
	var chaos_comment = ""
	if chaos_delta > 0:
		chaos_comment = "The world felt your absence; chaos took root in the shadows."
	else:
		chaos_comment = "Your systems held. The world was peaceful."
		
	munin_label.text = "MUNIN: \"I remember your return, All-Father. %s %s\"" % [chaos_comment, rumor]

func _on_continue_button_pressed():
	# Hide dashboard and resume game
	self.hide()
	get_tree().paused = false

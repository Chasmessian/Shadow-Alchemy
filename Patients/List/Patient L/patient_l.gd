extends Patient
func create():
	species = IntelliJellyfish
	stats = patientStats.new()
	stats.age = 40
	stats.curseAge = 10
	stats.isAdult = true
	stats.weight = 90
	curse = vampirism.new()
	texture = load("res://Patients/Sprites/intellijellyfish1.png")
	conversationNode = load("res://Patients/List/Patient L/patient_l_convo.tscn")
	exitDialogue = {
		"perfect" : "Thank you, I feel much better",
		"decent" : "Thank you... I guess",
		"failed" : "DoD."
	}

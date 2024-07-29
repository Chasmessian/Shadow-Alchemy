extends Patient
func create():
	species = Human
	stats = patientStats.new()
	stats.age = 40
	stats.curseAge = 10
	stats.isAdult = true
	stats.weight = 90
	curse = OzythsLuck.new()
	texture = load("res://Patients/Sprites/wizard1.png")
	conversationNode = load("res://Patients/List/Patient G/patient_g_convo.tscn")
	exitDialogue = {
		"perfect" : "Are you telling me traffic might be better? Thank you",
		"decent" : "Thanks... I don't feel entirely better",
		"failed" : "I'm getting a call from the fire extinguishing wizard squad. Oh no...", 
		"allergic" : "Just my luck, I'm allergic to this"
	}

extends Patient
func create():
	species = Human
	stats = patientStats.new()
	stats.age = 40
	stats.curseAge = 3
	stats.isAdult = true
	stats.weight = 90
	curse = Lycanthropy.new()
	texture = load("res://Patients/Sprites/wizard2.png")
	conversationNode = load("res://Patients/List/Patient A/patient_a_convo.tscn")
	exitDialogue = {
		"perfect" : "Oh hey. My cravings have gone. Thanks.",
		"decent" : "You sure this'll work?",
		"failed" : "I can still feel the moon", 
		"allergic" : "I think I'm having a bad reaction to something in there."
	}

extends Patient
func create():
	species = Human
	stats = patientStats.new()
	stats.age = 40
	stats.curseAge = 10
	stats.isAdult = true
	stats.weight = 90
	curse = vampirism.new()
	texture = load("res://Patients/Sprites/wizard1.png")
	conversationNode = load("res://Patients/List/Patient E/patient_e_convo.tscn")
	exitDialogue = {
		"perfect" : "Woah, I feel incredible",
		"decent" : "That seemed to work a little bit",
		"failed" : "I'm not sure that worked", 
		"allergic" : "I can barely breathe"
	}

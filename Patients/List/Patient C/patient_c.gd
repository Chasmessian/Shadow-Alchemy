extends Patient
func create():
	species = Demon
	stats = patientStats.new()
	stats.age = 40
	stats.curseAge = 10
	stats.isAdult = true
	stats.weight = 90
	curse = vampirism.new()
	texture = load("res://Patients/Sprites/Transformed2.png")
	conversationNode = load("res://Patients/List/Patient C/patient_c_convo.tscn")
	vocals = load("res://Patients/Base/Species/sounds/lamppost.ogg")
	exitDialogue = {
		"perfect" : "Thank you, I feel much better",
		"decent" : "Thank you... I guess",
		"failed" : "The Transformed."
	}

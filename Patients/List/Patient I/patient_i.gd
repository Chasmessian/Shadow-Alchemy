extends Patient
func create():
	species = Demon
	stats = patientStats.new()
	stats.age = 30
	stats.curseAge = 0
	stats.isAdult = true
	stats.weight = 90
	curse = vampirism.new()
	texture = load("res://Patients/Sprites/demon.png")
	conversationNode = load("res://Patients/List/Patient I/patient_i_convo.tscn")
	exitDialogue = {
		"perfect" : "Thank you, I feel much better",
		"decent" : "Thank you... I guess",
		"failed" : "Frozenheart."
	}

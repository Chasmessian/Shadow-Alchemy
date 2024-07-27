extends Patient
func create():
	species = Demon
	stats = patientStats.new()
	stats.age = 40
	stats.curseAge = 10
	stats.isAdult = true
	stats.weight = 90
	curse = vampirism.new()
	texture = load("res://Patients/Sprites/demon.png")
	conversationNode = load("res://Patients/List/Patient N/patient_n_convo.tscn")
	exitDialogue = {
		"perfect" : "Thank you, I feel much better",
		"decent" : "Thank you... I guess",
		"failed" : "PPP."
	}

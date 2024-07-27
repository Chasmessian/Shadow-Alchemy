extends Patient
func create():
	species = Fey
	stats = patientStats.new()
	stats.age = 40
	stats.curseAge = 10
	stats.isAdult = true
	stats.weight = 90
	curse = vampirism.new()
	texture = load("res://Patients/Sprites/Fey1.png")
	conversationNode = load("res://Patients/List/Patient2/patient2Convo.tscn")
	exitDialogue = {
		"perfect" : "Thank you, I feel much better",
		"decent" : "Thank you... I guess",
		"failed" : "...mmmm O- sounds tasty right about now"
	}

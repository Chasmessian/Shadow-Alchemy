extends Patient
func create():
	species = IntelliJellyfish
	stats = patientStats.new()
	stats.age = 24
	stats.curseAge = 9
	stats.isAdult = true
	stats.weight = 75
	curse = vampirism.new()
	texture = load("res://Patients/Sprites/intellijellyfish1.png")
	conversationNode = load("res://Patients/List/Patient1/patient1Convo.tscn")
	exitDialogue = {
		"perfect" : "Thank you, I feel much better",
		"decent" : "Thank you... I guess",
		"failed" : "...mmmm O- sounds tasty right about now"
	}

extends Patient
func create():
	species = IntelliJellyfish
	stats = patientStats.new()
	stats.age = 40
	stats.curseAge = 10
	stats.isAdult = true
	stats.weight = 90
	curse = DiseaseOfDevouring.new()
	texture = load("res://Patients/Sprites/intellijellyfish1.png")
	conversationNode = load("res://Patients/List/Patient L/patient_l_convo.tscn")
	exitDialogue = {
		"perfect" : "I feel... full, thanks",
		"decent" : "That seemed to have a very small effect",
		"failed" : "I'm so hungry still",
		"allergic" : "If anything, that made it worse"
	}

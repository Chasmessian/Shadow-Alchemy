extends Patient
func create():
	species = IntelliJellyfish
	stats = patientStats.new()
	stats.age = 40
	stats.curseAge = 10
	stats.isAdult = true
	stats.weight = 90
	curse = DeadVines.new()
	texture = load("res://Patients/Sprites/intellijellyfish1.png")
	conversationNode = load("res://Patients/List/Patient O/patient_o_convo.tscn")
	exitDialogue = {
		"perfect" : "I feel much better, thank you",
		"decent" : "I... am dying slower, that's nice",
		"failed" : "I'm... going ... to die ... aren't I?", 
		"allergic" : "...This feels like it is ...speeding it up ... it doesn't ... agree ... with me"
	}

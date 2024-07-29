extends Patient
func create():
	species = IntelliJellyfish
	stats = patientStats.new()
	stats.age = 40
	stats.curseAge = 10
	stats.isAdult = true
	stats.weight = 90
	curse = Zombification.new()
	texture = load("res://Patients/Sprites/intellijellyfish1.png")
	conversationNode = load("res://Patients/List/Patient F/patient_f_convo.tscn")
	exitDialogue = {
		"perfect" : "I was... a zombie?",
		"decent" : "I... feel better... ish",
		"failed" : "I think I'm going to go sleep this off", 
		"allergic" : "I'm turning blue"
	}

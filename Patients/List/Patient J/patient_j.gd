extends Patient
func create():
	species = Demon
	stats = patientStats.new()
	stats.age = 40
	stats.curseAge = 10
	stats.isAdult = true
	stats.weight = 90
	curse = Fireflu.new()
	texture = load("res://Patients/Sprites/demon.png")
	conversationNode = load("res://Patients/List/Patient J/patient_j_convo.tscn")
	particles = load("res://Patients/List/Patient J/flame.tscn")
	particlesGetCured = true
	exitDialogue = {
		"perfect" : "Woah, thank you so much",
		"decent" : "FEELS SLIGHTLY COLDER, AAAAAAAAAAHHHH",
		"failed" : "AAAAAHHHHHH",
		"allergic" : "AAAAAHHHH, not my veins burn too"
	}

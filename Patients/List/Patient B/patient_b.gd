extends Patient
func create():
	species = Fey
	stats = patientStats.new()
	stats.age = 40
	stats.curseAge = 10
	stats.isAdult = true
	stats.weight = 90
	curse = MambellaEffect.new()
	texture = load("res://Patients/Sprites/Fey1.png")
	conversationNode = load("res://Patients/List/Patient B/patient_b_convo.tscn")
	exitDialogue = {
		"perfect" : "Thank you, I feel much better",
		"decent" : "Thank you... I guess",
		"failed" : "Mambella Effect."
	}

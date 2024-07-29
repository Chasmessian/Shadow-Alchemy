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
		"perfect" : "Oh wow, I just realized dragons don't have hair",
		"decent" : "Thank you... I guess",
		"failed" : "Thanks, dentist",
		"allergic" : "I'm not sure my body agrees with this stuff"
	}

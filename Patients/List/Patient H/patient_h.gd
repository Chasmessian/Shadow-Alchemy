extends Patient
func create():
	species = Fey
	stats = patientStats.new()
	stats.age = 40
	stats.curseAge = 10
	stats.isAdult = true
	stats.weight = 90
	curse = merlinism.new()
	texture = load("res://Patients/Sprites/Fey1.png")
	conversationNode = load("res://Patients/List/Patient H/patient_h_convo.tscn")
	exitDialogue = {
		"perfect" : "My back, it is young again",
		"decent" : "Now I feel 75, but thanks, I guess",
		"failed" : "I don't feel a day under 80",
		"allergic" : "My joints are not taking this well"
	}

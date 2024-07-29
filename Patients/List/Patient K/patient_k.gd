extends Patient
func create():
	species = Fey
	stats = patientStats.new()
	stats.age = 40
	stats.curseAge = 10
	stats.isAdult = true
	stats.weight = 90
	curse = PostPossessionParanoia.new()
	texture = load("res://Patients/Sprites/Fey1.png")
	conversationNode = load("res://Patients/List/Patient K/patient_k_convo.tscn")
	exitDialogue = {
		"perfect" : "I think I should quit my job and take up painting again",
		"decent" : "alright, I feel normal. I don't remember what normal is, but this feels close...",
		"failed" : "Not sure that did anything",
		"allergic" : "This can't be good for me"
	}

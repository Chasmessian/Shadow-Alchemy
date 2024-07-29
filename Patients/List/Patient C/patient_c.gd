extends Patient
func create():
	species = Demon
	stats = patientStats.new()
	stats.age = 40
	stats.curseAge = 10
	stats.isAdult = true
	stats.weight = 90
	stats.inanimate = true
	curse = transformed.new()
	texture = load("res://Patients/Sprites/Transformed2.png")
	conversationNode = load("res://Patients/List/Patient C/patient_c_convo.tscn")
	vocals = load("res://Patients/Base/Species/sounds/lamppost.ogg")
	exitDialogue = {
		"perfect" : "Oh wow, I'm feel myself slowly changing back",
		"decent" : "I have a bit more feeling, but not much",
		"failed" : "LAMPPOST", 
		"allergic" : "I'm not sure I can have this"
	}

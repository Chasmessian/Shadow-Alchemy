extends Patient
func create():
	species = Shadow
	stats = patientStats.new()
	stats.age = 100000
	stats.curseAge = 10000000
	stats.isAdult = true
	stats.weight = 0
	curse = examplitis.new()
	texture = load("res://Patients/tutorialShadow/shadow.png")
	conversationNode = load("res://Patients/tutorialShadow/tutorialConversation.tscn")
	exitDialogue = {
		"perfect" : "I knew you could do it!",
		"decent" : "Pay a bit more attention next time, got it?",
		"failed" : "I didn't actually have a curse, but now I think I might... That was not what you were instructed to do."
	}

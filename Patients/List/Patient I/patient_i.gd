extends Patient
func create():
	species = Demon
	stats = patientStats.new()
	stats.age = 30
	stats.curseAge = 0
	stats.isAdult = true
	stats.weight = 90
	curse = frozenHeart.new()
	texture = load("res://Patients/Sprites/demon.png")
	conversationNode = load("res://Patients/List/Patient I/patient_i_convo.tscn")
	exitDialogue = {
		"perfect" : "Oh wow... I'm sorry if I was rude, thanks",
		"decent" : "bye",
		"failed" : "Bye, fraud", 
		"allergic" : "why did you poison me with this?"
	}

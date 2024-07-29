extends Patient
func create():
	species = Human
	stats = patientStats.new()
	stats.age = 40
	stats.curseAge = 10
	stats.isAdult = true
	stats.weight = 90
	curse = common_mould.new()
	texture = load("res://Patients/Sprites/wizard2.png")
	conversationNode = load("res://Patients/List/Patient D/patient_d_convo.tscn")
	exitDialogue = {
		"perfect" : "I'm feeling awake again, thanks!",
		"decent" : "Thank you... I guess",
		"failed" : "*cough*", 
		"allergic" : "Is this supposed to make my arm swell?"
	}

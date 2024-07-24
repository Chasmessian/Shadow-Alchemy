extends Patient
func _init():
	stats = patientStats.new()
	stats.age = 24
	stats.curseAge = 9
	stats.isAdult = true
	stats.weight = 75
	curse = vampirism.new()
	texture = load("res://Patients/Sprites/wizard1.png")

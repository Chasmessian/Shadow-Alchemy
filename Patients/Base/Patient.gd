extends Node2D
var stats = patientStats.new()
var curse = null
var species = Human
func ratePotion(potion):
	var points = 0
	if(curse==null or species == null):
		return
	points += curse.cure(potion, stats)
	#then add the rating from the affliction
	pass

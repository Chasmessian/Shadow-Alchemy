class_name Patient
extends Node2D
var stats = null #patientStats.gd
var curse = null
var species = Human
var texture = null
var conversationNode = null
func ratePotion(potion):
	#alter potion based on race
	var points = 0
	if(curse==null or species == null):
		return
	points += curse.cure(potion, stats)
	#then add the rating from the species
	print(points)
	return points

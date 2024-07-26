class_name Patient
extends Node2D
var stats = null #patientStats.gd
var curse = null
var species = Human
var texture = null
var conversationNode = null
var vocals = null
var canSpeak = true #for vocals, disable for echos
func _init():
	create()	
	if(vocals==null):
		vocals = species.vocals
func create():
	pass
func ratePotion(potion):
	#alter potion based on race
	var points = 0
	if(curse==null or species == null):
		return
	points += curse.cure(potion, stats, species)
	#then add the rating from the species
	points += species.ratePotion(potion)
	print(points)
	return points

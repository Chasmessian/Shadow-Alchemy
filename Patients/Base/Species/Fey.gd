class_name Fey
extends Species
static var vocals = preload("res://Patients/Base/Species/sounds/fey.ogg")
static func ratePotion(potion):
	if(potion.contains(Iron)):
		return 0
	else:
		return 3
static func attemptSwap(ingredient):
	if(ingredient == HobGoblossom):
		return Iron

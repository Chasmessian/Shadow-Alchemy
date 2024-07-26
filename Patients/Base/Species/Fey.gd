class_name Fey
extends Species
static var vocals = preload("res://Patients/Base/Species/sounds/fey.ogg")
static func ratePotion(potion):
	if(potion.contains(Iron)):
		return -3
	else:
		return 0
static func attemptSwap(ingredient):
	if(ingredient == HobGoblossom):
		return Iron

class_name Human
extends Species
static var vocals = preload("res://Patients/Base/Species/sounds/human.ogg")
static func ratePotion(potion):
	if(potion.contains(ShadowWood)):
		return -3
	else:
		return 0
static func attemptSwap(ingredient):
	if(ingredient == Potato):
		return ShadowWood

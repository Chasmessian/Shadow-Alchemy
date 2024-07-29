class_name IntelliJellyfish
extends Species
static var vocals = preload("res://Patients/Base/Species/sounds/intellijelly.ogg")
static func ratePotion(potion):
	if(potion.contains(HobGoblossom)):
		return [-3, true]
	else:
		return [0, false]
static func attemptSwap(ingredient):
	if(ingredient == Iron):
		return HobGoblossom

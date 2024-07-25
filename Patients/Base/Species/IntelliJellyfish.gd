class_name IntelliJellyfish
extends Species
static var vocals = preload("res://Patients/Base/Species/sounds/intellijelly.ogg")
static func ratePotion(potion):
	if(potion.contains(HobGoblossom)):
		return 0
	else:
		return 3
static func attemptSwap(ingredient):
	if(ingredient == Iron):
		return HobGoblossom

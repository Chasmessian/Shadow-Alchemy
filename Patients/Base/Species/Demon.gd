class_name Demon
extends Species
static func ratePotion(potion):
	if(potion.contains(Potato)):
		return -3
	else:
		return 0
static func attemptSwap(ingredient):
	if(ingredient == ShadowWood):
		return Potato

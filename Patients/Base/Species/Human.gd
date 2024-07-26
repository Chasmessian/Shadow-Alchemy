class_name Human
extends Species
static func ratePotion(potion):
	if(potion.contains(ShadowWood)):
		return -3
	else:
		return 0
static func attemptSwap(ingredient):
	if(ingredient == Potato):
		return ShadowWood

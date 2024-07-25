class_name Human
extends Species
static func ratePotion(potion):
	if(potion.contains(ShadowWood)):
		return 0
	else:
		return 3
static func attemptSwap(ingredient):
	if(ingredient == Potato):
		return ShadowWood

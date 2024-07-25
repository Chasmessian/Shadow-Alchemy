class_name Demon
extends Species
static func ratePotion(potion):
	if(potion.contains(Potato)):
		return 0
	else:
		return 3
static func attemptSwap(ingredient):
	if(ingredient == ShadowWood):
		return Potato

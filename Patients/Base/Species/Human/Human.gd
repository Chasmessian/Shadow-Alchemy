class_name Human
extends Species
func rate_potion(potion):
	if(potion.contains(ShadowWood)):
		return 0
	else:
		return 1

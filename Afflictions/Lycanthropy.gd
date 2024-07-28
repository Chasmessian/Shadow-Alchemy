class_name Lycanthropy
extends affliction
func _init():
	solutionIngredients = [ShadowWood, Silverleaf, NorthernFang]
func cure(potion : Potion, stats : patientStats, species):
	var doses = [stats.curseAge, 4, 2]
	return ratePotion(potion, doses, species)

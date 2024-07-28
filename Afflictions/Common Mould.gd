class_name common_mould
extends affliction
func _init():
	solutionIngredients = [Silverleaf, GarlicNettle, DragonGrass]
#var solutionDoses = []
func cure(potion, stats, species):
	var doses = [3,2,8]
	return ratePotion(potion, doses, species)

class_name examplitis
extends affliction
func _init():
	solutionIngredients = [DragonGrass, Iron, HobGoblossom]
#var solutionDoses = []
func cure(potion, stats, species):
	var doses = [1,1,1]
	return ratePotion(potion, doses,species)

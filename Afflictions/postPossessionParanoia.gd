class_name PostPossessionParanoia
extends affliction
func _init():
	solutionIngredients = [HarpyTongue, Iron, ShadowWood]
func cure(potion : Potion, stats : patientStats, species):
	var doses = [3,4,2]
	return ratePotion(potion, doses, species)

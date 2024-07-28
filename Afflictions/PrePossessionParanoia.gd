class_name PrePossessionParanoia
extends affliction
func _init():
	solutionIngredients = [Batwort, BloodRose, HobGoblossom]
func cure(potion : Potion, stats : patientStats, species):
	var doses = [4,2,1]
	if(stats.curseAge<7):
		doses[0] = 3
	if(stats.seesThings):
		doses[2] = 2
	return ratePotion(potion, doses, species)

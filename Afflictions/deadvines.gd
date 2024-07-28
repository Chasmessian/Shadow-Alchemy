class_name DeadVines
extends affliction
func _init():
	solutionIngredients = [Iron, Silverleaf, Iron]
func cure(potion : Potion, stats : patientStats, species):
	var doses = [0,0,0]
	if(potion.doses[0]>4):
		for i in range(len(potion.doses)):
			doses[i] = potion.doses[i] + 1
		return ratePotion(potion, doses, species)
	doses[0] = potion.doses[0]
	doses[1] = 5-doses[0]
	doses[2] = floor(2.5*doses[1])
	return ratePotion(potion, doses, species)


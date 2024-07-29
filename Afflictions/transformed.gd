class_name transformed
extends affliction
func _init():
	solutionIngredients = [NorthernFang, BloodRose, HobGoblossom]
func cure(potion : Potion, stats : patientStats, species):
	#var bloodRoseDose = floor(float(stats.weight)/20.0)*2
	var doses = [3,10,1]
	if(stats.inanimate):
		doses[0] = 5
	return ratePotion(potion, doses, species)

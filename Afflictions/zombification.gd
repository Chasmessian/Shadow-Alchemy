class_name Zombification
extends affliction
func _init():
	solutionIngredients = [GarlicNettle, BloodRose, HobGoblossom]
func cure(potion : Potion, stats : patientStats, species):
	var allergic = 2
	if(species == IntelliJellyfish):
		allergic = 3
	var doses = [stats.curseAge*2,4,allergic]
	return ratePotion(potion, doses, species)

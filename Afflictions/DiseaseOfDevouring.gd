class_name DiseaseOfDevouring
extends affliction
func _init():
	solutionIngredients = [HarpyTongue, Potato, DragonGrass]
func cure(potion : Potion, stats : patientStats, species):
	var harpyDose = floor(stats.curseAge/3)+1
	var potatoDose = stats.curseAge*2
	var dragonDose = floor(float(potatoDose)/float(harpyDose))
	var doses = [harpyDose, potatoDose, dragonDose]
	return ratePotion(potion, doses, species)

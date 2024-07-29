class_name CurseofEchoes
extends affliction
func _init():
	solutionIngredients = [HarpyTongue, NorthernFang, Batwort]
func cure(potion : Potion, stats : patientStats, species):
	var doses = [4,4, min(7, World.totalPatients-World.instance.patientCount)]
	return ratePotion(potion, doses, species)

class_name MambellaEffect
extends affliction
func _init():
	solutionIngredients = [HarpyTongue, BloodRose, Potato]
func cure(potion : Potion, stats : patientStats, species):
	return ratePotion(potion, potion.doses, species)

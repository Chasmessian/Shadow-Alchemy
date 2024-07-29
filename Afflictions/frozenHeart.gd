class_name frozenHeart
extends affliction
func _init():
	solutionIngredients = [Potato, GoldWeed, ShadowWood]
func cure(potion : Potion, stats : patientStats, species):
	var potatoDose = 3-(stats.age%2) #3 if even, else 2
	var GoldWeedDose = 3-(stats.curseAge%2)
	var doses = [potatoDose, GoldWeedDose, 2]
	return ratePotion(potion, doses, species)

class_name vampirism
extends affliction
func _init():
	solutionIngredients = [Batwort, GarlicNettle, Potato]
func cure(potion, stats):
	var garlicAmount = floor(stats.curseAge/2)
	var doses = [3,garlicAmount, garlicAmount/2]
	ratePotion(potion, doses)

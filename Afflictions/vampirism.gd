class_name vampirism
extends affliction
func _init():
	solutionIngredients = [Batwort, GarlicNettle, Potato]
func cure(potion, stats, species):
	print("ATTEMPT TO CURE VAMPIRISM")
	var garlicAmount = floor(stats.curseAge/2)
	var doses = [3,garlicAmount, garlicAmount/2]
	return ratePotion(potion, doses, species)

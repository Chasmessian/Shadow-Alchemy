class_name OzythsLuck
extends affliction
func _init():
	solutionIngredients = [GoldWeed, Iron, Potato]
func cure(potion : Potion, stats : patientStats, species):
	var amount = 3
	if(species == Fey):
		amount = 2
	elif(species == Demon):
		amount = 4
	var doses = [amount,amount, amount]
	return ratePotion(potion, doses, species)

 

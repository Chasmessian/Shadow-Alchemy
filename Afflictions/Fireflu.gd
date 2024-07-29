class_name Fireflu
extends affliction
func cure(potion : Potion, stats : patientStats, species):
	if(species == Fey):
		solutionIngredients = [GarlicNettle, GoldWeed, Silverleaf]
	elif(species==Demon):
		solutionIngredients = [GoldWeed, Silverleaf, ShadowWood]
	elif(species==IntelliJellyfish):
		solutionIngredients = [HarpyTongue, GoldWeed, GarlicNettle]
	else:
		solutionIngredients = [HobGoblossom, NorthernFang, Iron]
	var doses = [2,2,2]
	return ratePotion(potion, doses, species)

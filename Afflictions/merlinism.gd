class_name merlinism
extends affliction
func _init():
	solutionIngredients = [NorthernFang, Batwort, DragonGrass]
func cure(potion : Potion, stats : patientStats, species):
	var northernDose = floor(stats.age / 10.0)
	var localMinutes = Time.get_time_dict_from_system()["minute"]
	#print(localMinutes)
	#print(localMinutes%10)
	var doses = [northernDose,2, localMinutes%10]
	return ratePotion(potion, doses, species)

 

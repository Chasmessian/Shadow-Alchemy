class_name affliction
var solutionIngredients = []
func ratePotion(potion, doses, species):
	for i in range(len(doses)):
		if(doses[i]==0):
			doses[i]=1 #minimum of 1 ingredient
	print("CURING")
	var pointsEarned = 10
	var perfect = true
	#10 points possible
	#3 allocated for each slot
	#1 extra if all is perfect
	
	#3 if all correct
	#1 if dose incorrect
	#0 if ingredient incorrect
	for i in range(3):
		if(potion.ingredients[i]!=solutionIngredients[i]):
			if(species.attemptSwap(potion.ingredients[i])!=solutionIngredients[i]):
				pointsEarned-=3
				perfect = false
		elif(potion.doses[i]!=doses[i]):
			pointsEarned-=2
			perfect = false
	if(!perfect):
		pointsEarned-=1
	print(pointsEarned)
		
	return pointsEarned
	#will have if statements to see if potion matches the requirements

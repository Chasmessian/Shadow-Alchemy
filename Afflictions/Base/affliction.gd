class_name affliction
extends Node
var solutionIngredients = []
func ratePotion(potion, doses):
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
			pointsEarned-=3
			perfect = false
		elif(potion.doses[i]!=doses[i]):
			pointsEarned-=2
			perfect = false
	if(!perfect):
		pointsEarned-=1
	#will have if statements to see if potion matches the requirements

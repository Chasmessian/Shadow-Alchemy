extends Node
var ingredients = {} #ingredients as keys, dose amounts as values
func contains(ingredient):
	if(ingredient in ingredients.keys()):
		return true
	return false

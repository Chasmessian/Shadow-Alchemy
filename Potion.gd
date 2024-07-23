class_name Potion
extends Node
var ingredients = []
var doses = []
func contains(ingredient):
	if(ingredient in ingredients):
		return true
	return false

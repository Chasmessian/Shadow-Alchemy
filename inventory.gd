class_name Inventory
extends Node
#autoload
static var storage = {} #dict for now, may change. keys are classes themselves, values are amounts

static func add(ingredient, amount):
	if(ingredient in storage.keys()):
		storage[ingredient]+=amount
	else:
		storage[ingredient]=amount

static func remove(ingredient, amount): #returns true if can, false if can't
	if(ingredient in storage.keys()):
		if(storage[ingredient]>=amount):
			storage[ingredient]-=amount
		else:
			return false
	return false

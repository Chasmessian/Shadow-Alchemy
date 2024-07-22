class_name Garden
extends Control
var pots = []
static var mode = "plant" #plant, water, harvest
static var selectedSeed = load("res://Ingredients/goldweed/goldweed_plant.tscn")
func _ready():
	for i in range($Pots.get_child_count()):
		pots.append($Pots.get_child(i))

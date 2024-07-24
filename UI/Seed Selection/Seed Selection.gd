class_name SeedSelection
extends Node2D

static var seedToPlant = {
	Batwort : "res://Ingredients/Batwort/batwortPlant.tscn",
	BloodRose : "res://Ingredients/blood rose/blood_rose_plant.tscn",
	DragonGrass : "res://Ingredients/Dragongrass/dragon_grass_plant.tscn",
	GarlicNettle : "res://Ingredients/garlic nettle/garlic_nettle_plant.tscn",
	GoldWeed : "res://Ingredients/goldweed/goldweed_plant.tscn",
	HarpyTongue : "res://Ingredients/harpy tongue/harpy_tongue_plant.tscn",
	HobGoblossom : "res://Ingredients/Hob Goblossom/hob_goblossom_plant.tscn",
	Iron : "res://Ingredients/Iron/iron_plant.tscn",
	NorthernFang : "res://Ingredients/Northern Fang/northern_fang_plant.tscn",
	Potato : "res://Ingredients/potato/potato_plant.tscn",
	ShadowWood : "res://Ingredients/ShadowWood/shadow_wood_plant.tscn",
	Silverleaf : "res://Ingredients/silverleaf/silverleaf_plant.tscn"
}

var selected = null

func _ready():
	var topRow = $"HBoxContainer/VBoxContainer/PanelContainer/VBoxContainer/Top Seed Row"
	for i in range(topRow.get_child_count()):
		topRow.get_child(i).selected.connect(highlight)
	var bottomRow = $"HBoxContainer/VBoxContainer/PanelContainer/VBoxContainer/Bottom Seed Row"
	for i in range(bottomRow.get_child_count()):
		bottomRow.get_child(i).selected.connect(highlight)
	
func highlight(ingredient): #ingredient is the actual slot, so that it may be highlighted
	if(selected!=null):
		selected.deselect()
	#print(ingredient)
	selected = ingredient
	
func selectIngredient():
	if(selected!=null):
		Garden.selectedSeed = load(seedToPlant[selected.ingredient])
	call_deferred("close")
func close():
	World.instance.closeMenu()

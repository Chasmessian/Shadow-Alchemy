extends Node2D
var itemSlotScene = preload("res://UI/MixingScene/itemSlot.tscn")
@onready var inventoryControl = $VBoxContainer/PanelContainer/ScrollContainer/Inventory
func _ready():
	#testing purposes
	
	#Inventory.add(Batwort, 5)
	#Inventory.add(BloodRose, 5)
	#Inventory.add(DragonGrass, 5)
	#Inventory.add(GarlicNettle, 5)
	#Inventory.add(GoldWeed,5)
	#Inventory.add(HarpyTongue,5)
	#Inventory.add(HobGoblossom,5)
	#Inventory.add(Iron,5)
	#Inventory.add(NorthernFang,5)
	#Inventory.add(Potato,5)
	#Inventory.add(ShadowWood,5)	
	#Inventory.add(Silverleaf,5)
	
	
	
	
	
	
	load_inventory()
	
func load_inventory():
	inventoryControl.add_child(load("res://UI/MixingScene/spacing.tscn").instantiate())
	for i in Inventory.storage.keys():
		if(Inventory.storage[i]!=0):
			var slot = itemSlotScene.instantiate()
			slot.ingredient = i
			print(i)
			inventoryControl.add_child(slot)
			inventoryControl.add_child(load("res://UI/MixingScene/spacing.tscn").instantiate())


func closeMenu():
	World.instance.closeMenu()

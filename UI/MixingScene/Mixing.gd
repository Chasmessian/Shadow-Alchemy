extends Node2D
var itemSlotScene = preload("res://UI/MixingScene/itemSlot.tscn")
func _ready():
	Inventory.add(ShadowWood,5)	
	load_inventory()
	
func load_inventory():
	for i in Inventory.storage.keys():
		if(Inventory.storage[i]!=0):
			var slot = itemSlotScene.instantiate()
			var ingredientItem = i.new()
			slot.image = ingredientItem.image
			slot.label = ingredientItem.label
			$VBoxContainer/ScrollContainer/Inventory.add_child(slot)

extends Node2D
var itemSlotScene = preload("res://UI/MixingScene/itemSlot.tscn")
@onready var inventoryControl = $VBoxContainer/InventoryHbox/PanelContainer/ScrollContainer/Inventory
var draggedIngredient = null
var draggedSlot = null
@export var draggedScene : PackedScene
@onready var ingredientSlots = [$"VBoxContainer/HBoxContainer/Mixing Panel/HBoxContainer/Slots/Mixing Slot",$"VBoxContainer/HBoxContainer/Mixing Panel/HBoxContainer/Slots/Mixing Slot2", $"VBoxContainer/HBoxContainer/Mixing Panel/HBoxContainer/Slots/Mixing Slot3"]

func _ready():
	#testing purposes
	
	Inventory.add(Batwort, 1)
	Inventory.add(BloodRose, 5)
	Inventory.add(DragonGrass, 5)
	Inventory.add(GarlicNettle, 5)
	Inventory.add(GoldWeed,5)
	Inventory.add(HarpyTongue,5)
	Inventory.add(HobGoblossom,5)
	Inventory.add(Iron,5)
	Inventory.add(NorthernFang,5)
	Inventory.add(Potato,5)
	Inventory.add(ShadowWood,5)	
	Inventory.add(Silverleaf,5)
	
	
	
	
	
	
	load_inventory()
	
func load_inventory():
	inventoryControl.add_child(load("res://UI/MixingScene/spacing.tscn").instantiate())
	for i in Inventory.storage.keys():
		if(Inventory.storage[i]!=0):
			var slot = itemSlotScene.instantiate()
			slot.ingredient = i
			#print(i)
			slot.drag.connect(drag)
			inventoryControl.add_child(slot)
			inventoryControl.add_child(load("res://UI/MixingScene/spacing.tscn").instantiate())


func closeMenu():
	World.instance.closeMenu()

func drag(slot):
	#print("DRAGGING")
	#print(slot)
	draggedSlot = slot
	draggedIngredient = draggedScene.instantiate()
	var newIngredient = slot.ingredient.new()
	draggedIngredient.texture = newIngredient.texture
	add_child(draggedIngredient)
	draggedIngredient.dropped.connect(droppedDrag)
	
func droppedDrag(node):
	for i in ingredientSlots:
		if(i.mouseInside):
			i.dropIngredient(draggedSlot.ingredient)
			node.queue_free()
			draggedSlot.consumed()
			return true
	cancelDrag(node)
	return false
	
func cancelDrag(node):
	#print(draggedSlot)
	node.queue_free()
	draggedSlot.cancelDrag()
	draggedIngredient = null
	
func drop(ingredient):
	pass

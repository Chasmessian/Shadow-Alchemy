extends Node2D
var itemSlotScene = preload("res://UI/MixingScene/itemSlot.tscn")
@onready var inventoryControl = $VBoxContainer/InventoryHbox/PanelContainer/VBoxContainer/ScrollContainer/Inventory
var draggedIngredient = null
var draggedSlot = null
@export var draggedScene : PackedScene
@onready var ingredientSlots = [$"VBoxContainer/HBoxContainer/Mixing Panel/HBoxContainer/Slots/Mixing Slot",$"VBoxContainer/HBoxContainer/Mixing Panel/HBoxContainer/Slots/Mixing Slot2", $"VBoxContainer/HBoxContainer/Mixing Panel/HBoxContainer/Slots/Mixing Slot3"]

func _ready():
	for i in ingredientSlots:
		i.subtracted.connect(slotSubtracted)
	#testing purposes
	#
	Inventory.add(Batwort, 1)
	Inventory.add(BloodRose, 5)
	Inventory.add(DragonGrass, 5)
	Inventory.add(GarlicNettle, 15)
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
			addSlot(i)
			

func addSlot(i):
	var slot = itemSlotScene.instantiate()
	slot.ingredient = i
	slot.name = str(i)
			#print(i)
	slot.drag.connect(drag)
	slot.delete.connect(deleteInvSlot)
	inventoryControl.add_child(slot)
	inventoryControl.add_child(load("res://UI/MixingScene/spacing.tscn").instantiate())
			
func closeMenu():
	for i in ingredientSlots:
		if(i.storedIngredient!=null):
			Inventory.add(i.storedIngredient, i.currentAmount)
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
func deleteInvSlot(ingredient):
	for i in range(inventoryControl.get_child_count()):
		if(inventoryControl.get_child(i) is mixingItemSlot):
			if(inventoryControl.get_child(i).ingredient == ingredient):
				inventoryControl.get_child(i).queue_free()
				inventoryControl.get_child(i+1).queue_free() #deletes control node immediately after 
	
func droppedDrag(node):
	for i in ingredientSlots:
		if(i.mouseInside and i.storedIngredient == null):
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

func slotSubtracted(ingredient):
	var inv = $VBoxContainer/InventoryHbox/PanelContainer/VBoxContainer/ScrollContainer/Inventory
	for i in range(inv.get_child_count()):
		if(inv.get_child(i).name == str(ingredient)):
			return
	addSlot(ingredient)
			


func submit():
	pass # Replace with function body.

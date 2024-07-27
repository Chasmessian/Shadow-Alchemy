extends HBoxContainer
var storedIngredient = null
var currentAmount = 0
var mouseInside : bool = false
@onready var label = $VBoxContainer2/Label
signal subtracted(ingredient) #when all resources of an ingredient are used, the inventory slot in mixing is removed, this is to ensure it comes back when subtracted
func dropIngredient(ingredient):
	#print(ingredient)	
	#Inventory.remove(ingredient,1)
	storedIngredient = ingredient
	var made = ingredient.new()
	currentAmount = 1
	$VBoxContainer/Panel/TextureRect.texture = made.texture
	label.visible = true
	label.text = "1 units"
	
func clearIngredient():
	if(storedIngredient==null):
		return
	Inventory.add(storedIngredient, currentAmount)
	subtracted.emit(storedIngredient)
	storedIngredient = null
	currentAmount = 0
	$VBoxContainer/Panel/TextureRect.texture = null
	label.hide()

func delete():
	storedIngredient = null
	currentAmount = 0
	$VBoxContainer/Panel/TextureRect.texture = null
	label.hide()
	
func _on_panel_mouse_entered():
	mouseInside = true
	
func _on_panel_mouse_exited():
	mouseInside = false


func subtract():
	if(currentAmount>0):
		Inventory.add(storedIngredient, 1)
		subtracted.emit(storedIngredient)
		currentAmount -= 1
		label.text = str(currentAmount) + " units"	
		if(Inventory.storage[storedIngredient]==0):
			$VBoxContainer/HBoxContainer/Subtract.hide()
		if($VBoxContainer/HBoxContainer/Add.visible==false):
			if(Inventory.storage[storedIngredient]>0):
				$VBoxContainer/HBoxContainer/Add.visible = true
		if(currentAmount==0):
			label.hide()
			clearIngredient()

func add():
	if(storedIngredient in Inventory.storage.keys()):
		if(Inventory.storage[storedIngredient]>0):
			Inventory.remove(storedIngredient, 1)
			currentAmount +=1 
			label.text = str(currentAmount) + " units"	
			if(Inventory.storage[storedIngredient]==0):
				$VBoxContainer/HBoxContainer/Add.visible = false
			if($VBoxContainer/HBoxContainer/Subtract.visible == false):
				if(currentAmount>0):
					$VBoxContainer/HBoxContainer/Subtract.visible = true
	pass # Replace with function body.

signal clicked
func click():
	clicked.emit()

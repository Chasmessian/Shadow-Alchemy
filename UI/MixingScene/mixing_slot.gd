extends HBoxContainer
var storedIngredient = null
var currentAmount = 0
var mouseInside : bool = false
signal subtracted(ingredient) #when all resources of an ingredient are used, the inventory slot in mixing is removed, this is to ensure it comes back when subtracted
func dropIngredient(ingredient):
	print(ingredient)	
	storedIngredient = ingredient
	var made = ingredient.new()
	currentAmount = 1
	$VBoxContainer/Panel/TextureRect.texture = made.texture
	$VBoxContainer/Label.visible = true
	$VBoxContainer/Label.text = "1 units"
func clearIngredient():
	Inventory.add(storedIngredient, currentAmount)
	subtracted.emit(storedIngredient)
	storedIngredient = null
	currentAmount = 0
	$VBoxContainer/Panel/TextureRect.texture = null
	$VBoxContainer/Label.hide()



func _on_panel_mouse_entered():
	mouseInside = true
	
func _on_panel_mouse_exited():
	mouseInside = false


func subtract():
	if(currentAmount>0):
		Inventory.add(storedIngredient, 1)
		subtracted.emit(storedIngredient)
		currentAmount -= 1
		$VBoxContainer/Label.text = str(currentAmount) + " units"	
		if(Inventory.storage[storedIngredient]==0):
			$VBoxContainer/HBoxContainer/Subtract.hide()
		if($VBoxContainer/HBoxContainer/Add.visible==false):
			if(Inventory.storage[storedIngredient]>0):
				$VBoxContainer/HBoxContainer/Add.visible = true
		if(currentAmount==0):
			$VBoxContainer/Label.hide()
			clearIngredient()

func add():
	if(storedIngredient in Inventory.storage.keys()):
		if(Inventory.storage[storedIngredient]>0):
			Inventory.remove(storedIngredient, 1)
			currentAmount +=1 
			$VBoxContainer/Label.text = str(currentAmount) + " units"	
			if(Inventory.storage[storedIngredient]==0):
				$VBoxContainer/HBoxContainer/Add.visible = false
			if($VBoxContainer/HBoxContainer/Subtract.visible == false):
				if(currentAmount>0):
					$VBoxContainer/HBoxContainer/Subtract.visible = true
	pass # Replace with function body.

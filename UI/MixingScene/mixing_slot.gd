extends HBoxContainer
var storedIngredient = null
var currentAmount = 0
var mouseInside : bool = false
func dropIngredient(ingredient):
	print(ingredient)	
	storedIngredient = ingredient
	var made = ingredient.new()
	$Panel/TextureRect.texture = made.texture
func clearIngredient():
	pass
func _process(delta):
	print(mouseInside)
	if(storedIngredient == null):
		return
	if(storedIngredient in Inventory.storage.keys()):
		$"Dose Slider".max_value = Inventory.storage[storedIngredient]

func _on_dose_slider_value_changed(value):
	$"Dose Slider/Label".text = str(value) + " units"
	if(storedIngredient in Inventory.storage.keys()):
		Inventory.storage[storedIngredient] += currentAmount-value
		currentAmount = value


func _on_panel_mouse_entered():
	mouseInside = true
	
func _on_panel_mouse_exited():
	mouseInside = false

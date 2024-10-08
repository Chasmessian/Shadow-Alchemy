class_name mixingItemSlot
extends VBoxContainer
@export var ingredient : Script = null
var ingredientMade = null
signal drag(ingred)
signal delete(ingred) #so that Mixing scene can properly delete this node as well as the spacing control node
func _ready():
	ingredientMade = ingredient.new()
	$TextureRect.texture = ingredientMade.texture
	updateLabel()
func _process(delta):
	$Label.text = ingredientMade.label + "  x" + str(Inventory.storage[ingredient])
	if(ingredient in Inventory.storage.keys()):
		if(Inventory.storage[ingredient]<=0):
			delete.emit(ingredient)
			
func updateLabel():
	$Label.text = ingredientMade.label + "  x" + str(Inventory.storage[ingredient])
	
func _on_gui_input(event):
	if(Input.is_action_just_pressed("click")):
		drag.emit(self)
		$Label.text = ingredientMade.label + "  x" + str(Inventory.storage[ingredient])
		if(Inventory.storage[ingredient]==1):
			hide()
func cancelDrag():
	visible = true
func consumed():
	Inventory.storage[ingredient]-=1
	$Label.text = ingredientMade.label + "  x" + str(Inventory.storage[ingredient])

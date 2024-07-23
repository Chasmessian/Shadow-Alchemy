extends VBoxContainer
@export var ingredient : Script = null
signal drag(ingred)
func _ready():
	var ingredientMade = ingredient.new()
	$TextureRect.texture = ingredientMade.texture
	$RichTextLabel.text = ingredientMade.label
func _process(delta):
	if(ingredient in Inventory.storage.keys()):
		if(Inventory.storage[ingredient]<=0):
			queue_free()	


func _on_gui_input(event):
	if(Input.is_action_just_pressed("click")):
		drag.emit(self)
		if(Inventory.storage[ingredient]==1):
			hide()
func cancelDrag():
	visible = true
func consumed():
	Inventory.storage[ingredient]-=1

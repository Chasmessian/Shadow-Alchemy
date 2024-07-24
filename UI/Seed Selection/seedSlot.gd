extends VBoxContainer
@export var ingredient : Script = null
signal selected(ingred)
func _on_gui_input(event):
	if(Input.is_action_just_pressed("click")):
		print("E")
		selected.emit(ingredient)

func _ready():
	var made = ingredient.new()
	$TextureRect.texture = made.texture
	$Label.text = made.label

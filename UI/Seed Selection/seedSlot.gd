extends VBoxContainer
@export var ingredient : Script = null
signal selected(ingred)
func _on_gui_input(event):
	if(Input.is_action_just_pressed("click")):
		#print("E")
		selected.emit(self)
		$TextureRect.material.set_shader_parameter("line_color", Vector4(1,0,0,1))
func _ready():
	var made = ingredient.new()
	$TextureRect.texture = made.texture
	$Label.text = made.label
func deselect():
	$TextureRect.material.set_shader_parameter("line_color", Vector4(0,0,0,0))
	

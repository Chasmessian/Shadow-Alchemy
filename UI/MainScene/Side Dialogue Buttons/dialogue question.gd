extends PanelContainer
var text = "BAGEL"
var id = -1
signal clicked
func _ready():
	$HBoxContainer/Label.text = text
func _on_gui_input(event):
	if(Input.is_action_just_pressed("click")):
		clicked.emit(id)

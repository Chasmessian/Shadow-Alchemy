extends Control

@onready var speech_icon = $"Speech Icon"

func _process(_delta):
	speech_icon.play("bob")

func _on_viewport_click_field_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT or event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				if get_node("Dialogue"):
					get_node("Dialogue").clicked()
				else:
					pass

func _on_dialogue_ending_dialogue():
	$"../Viewport Area2D".hide()
	hide()

func _on_dialogue_starting_dialogue():
	$"../Viewport Area2D".show()
	show()

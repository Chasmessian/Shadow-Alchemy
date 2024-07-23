extends TextureRect
signal dropped(myself)
func _process(delta):
	position = get_global_mouse_position()
	position += Vector2(-45,-45)
	if(Input.is_action_just_released("click")):
		dropped.emit(self)

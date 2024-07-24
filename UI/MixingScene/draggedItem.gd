extends TextureRect
signal dropped(myself)
func _process(delta):
	position = get_global_mouse_position()
	position += Vector2(-45,-45)
	#rotation_degrees += Input.get_last_mouse_velocity().x/100
	rotation_degrees = lerpf(rotation_degrees, Input.get_last_mouse_velocity().x/50, delta*10)
	rotation_degrees = clampf(rotation_degrees,-45,45)
	if(Input.is_action_just_released("click")):
		dropped.emit(self)

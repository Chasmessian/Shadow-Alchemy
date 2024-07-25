extends TextureRect
@export var amount = 1
func _process(delta):
	texture.noise.offset.x += 0.1

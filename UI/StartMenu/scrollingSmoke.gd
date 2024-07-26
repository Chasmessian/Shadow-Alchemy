extends TextureRect
@export var amount = 10
func _process(delta):
	texture.noise.offset.x += amount * delta
	texture.noise.offset.y += amount * delta
	texture.noise.offset.z += amount * delta

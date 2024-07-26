extends TextureRect
var time = 0
var gradeTexture = null
func _ready():
	if(gradeTexture == null):
		pass
	pivot_offset = size/2
func _process(delta):
	time+=delta
	rotation = sin(time)*(PI/6)

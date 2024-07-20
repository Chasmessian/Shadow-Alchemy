extends VBoxContainer
var image = null
var label = "NULL"
func _ready():
	$TextureRect.texture = image
	$RichTextLabel.text = label

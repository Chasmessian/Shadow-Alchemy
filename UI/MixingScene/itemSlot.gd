extends VBoxContainer
@export var ingredient : Script = null
func _ready():
	var ingredientMade = ingredient.new()
	$TextureRect.texture = ingredientMade.texture
	$RichTextLabel.text = ingredientMade.label

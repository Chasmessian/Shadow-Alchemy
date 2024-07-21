extends Control

@onready var speech_icon = $"Speech Icon"

func _process(_delta):
	speech_icon.play("bob")

# Maybe use a signal to signify when the arrow should show up and animate?
# To clarify, the dialogue gets typed out, and then the arrow appears when we're ready to move on.

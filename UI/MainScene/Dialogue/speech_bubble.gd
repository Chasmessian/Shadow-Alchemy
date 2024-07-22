extends Control

@onready var speech_icon = $"Speech Icon"

func _process(_delta):
	speech_icon.play("bob")

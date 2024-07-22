extends Node2D
var pots = []
func _ready():
	for i in range($Pots.get_child_count()):
		pots.append($Pots.get_child(i))

extends Node
var points = 0.0
var time = 0.0
func _process(delta):
	if(World.gameInProgress):
		time+=delta

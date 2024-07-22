class_name Plant
extends Node2D
var growthStage = 0
var totalStages = null
@export var ingredient : PackedScene = null
@export var amount = 1
@onready var sprite = $AnimatedSprite2D
func _ready():
	totalStages = sprite.sprite_frames.get_frame_count("default")-1 #minus one because it is zero indexed

func finishedWaterLevel(): #when stageProgress reaches 100
	growthStage +=1 
	if(growthStage <= totalStages):
		sprite.frame += 1
		return true
	else:
		queue_free()
		return false
		
func harvest():
	if(growthStage == totalStages):
		Inventory.add(ingredient, amount)
	queue_free()

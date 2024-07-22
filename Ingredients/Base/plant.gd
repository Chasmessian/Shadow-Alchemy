class_name Plant
extends Node2D
var growthStage = 0
var totalStages = null
var ingredient = null
var amount = 1
var stageProgress = 0 #fills up slowly, when hits 100, reaches next stage and needs water
var isWatering = false
@onready var sprite = $AnimatedSprite2D
func _ready():
	totalStages = sprite.sprite_frames.get_frame_count("default")-1 #minus one because it is zero indexed

func finishedWaterLevel(): #when stageProgress reaches 100
	growthStage +=1 
	isWatering = false
	if(growthStage < totalStages):
		sprite.sprite_frames.frame += 1
		
func harvest():
	if(growthStage == totalStages):
		Inventory.add(ingredient, amount)
	queue_free()
func startWater():
	if(isWatering):
		return false
	
	
	

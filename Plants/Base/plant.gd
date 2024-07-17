class_name Plant
extends Node2D
var growthStage = 0
var totalStages = 2
var ingredient = null
var amount = 1
var watered = false
var stageProgress = 0 #fills up slowly, when hits 100, reaches next stage and needs water
var stageSprites = [] #will contain the sprite to use for each stage

func harvest():
	if(growthStage == totalStages):
		Inventory.gain(ingredient, amount)

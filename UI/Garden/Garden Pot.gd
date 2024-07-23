extends Node2D
@onready var waterMeter = $Waterlevel
var plant : Plant = null
var isWatering = false
#func _ready():
	#growPlant(load("res://Ingredients/blood rose/blood_rose_plant.tscn"))

func growPlant(plantToGrow):
	if(plant==null):
		var newPlant = plantToGrow.instantiate()
		add_child(newPlant)
		plant = newPlant
		#isWatering = true
		
func harvest():
	plant.harvest()
	plant = null
	waterMeter.value = 0
	isWatering = false
	
func water():
	isWatering = true
	pass
func _physics_process(delta):
	if(isWatering):
		waterMeter.value += 1
		if(waterMeter.value==100):
			if(plant.finishedWaterLevel()):
				waterMeter.value = 0
				isWatering = false
			else:
				plant = null
				waterMeter.value = 0
				isWatering = false


func _on_area_2d_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == MOUSE_BUTTON_LEFT):
			if(Garden.mode == "plant"):
				growPlant(Garden.selectedSeed)
			elif(Garden.mode == "water"):
				if(plant!=null):
					water()
			elif(Garden.mode == "harvest"):
				if(plant!=null):
					harvest()
			

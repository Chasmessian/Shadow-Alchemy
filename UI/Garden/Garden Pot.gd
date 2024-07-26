extends Node2D
@onready var waterMeter = $Waterlevel
var plant : Plant = null
var isWatering = false
var waterProgress = 0
var waterIncrease = 5 #Time to water in seconds, roughly
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
	waterProgress = 0
	isWatering = false
	
func water():
	isWatering = true
	pass
func _process(delta):
	waterMeter.value = waterProgress
	
func _physics_process(delta):
	if(isWatering):
		waterProgress += 100/waterIncrease * delta
		waterProgress = clampf(waterProgress, 0,100)
		if(waterProgress==100):
			if(plant.finishedWaterLevel()):
				$leafs.emitting = true
				waterProgress = 0
				isWatering = false
			else:
				plant = null
				waterProgress = 0
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
			

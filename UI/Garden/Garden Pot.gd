extends Node2D
@onready var waterMeter = $Waterlevel
var plant : Plant = null
var isWatering = false
var waterProgress = 0
var waterIncrease = 5 #Time to water in seconds, roughly
#func _ready():
	#growPlant(load("res://Ingredients/blood rose/blood_rose_plant.tscn"))
static var plantingSounds = ["res://UI/Garden/Sounds/plant.wav", "res://UI/Garden/Sounds/plant2.wav", "res://UI/Garden/Sounds/plant3.wav", "res://UI/Garden/Sounds/plant4.wav", "res://UI/Garden/Sounds/plant5.wav"]
static var wateringSounds = ['res://UI/Garden/Sounds/watering/watering.wav','res://UI/Garden/Sounds/watering/watering2.wav', 'res://UI/Garden/Sounds/watering/watering4.wav', 'res://UI/Garden/Sounds/watering/watering5.wav']#, 'res://UI/Garden/Sounds/watering/watering3.wav']
static var harvestSounds = ["res://UI/Garden/Sounds/harvest1.wav", "res://UI/Garden/Sounds/harvest2.wav", "res://UI/Garden/Sounds/harvest3.wav", "res://UI/Garden/Sounds/harvest4.wav", "res://UI/Garden/Sounds/harvest5.wav"]
var isPlaying = false

func ready():
	$audio.volume_db =  Settings.getMiscVolume()
	Settings.miscChanged.connect(func():
		$audio.volume_db = Settings.getMiscVolume())

func growPlant(plantToGrow):
	if(!isPlaying):
		$audio.volume_db =  Settings.getMiscVolume()
		$audio.stream = load(plantingSounds.pick_random())
		$audio.play()
		$audio.finished.connect(func():
			isPlaying = false
			)
	if(plant==null):
		var newPlant = plantToGrow.instantiate()
		add_child(newPlant)
		plant = newPlant
		#isWatering = true
		
func harvest():
	if(!isPlaying):
		$audio.volume_db =  Settings.getMiscVolume()
		$audio.stream = load(harvestSounds.pick_random())
		$audio.play()
		$audio.finished.connect(func():
			isPlaying = false
			)
	plant.harvest()
	plant = null
	waterProgress = 0
	isWatering = false
	
func water():
	if(!isPlaying and !isWatering):
		$audio.volume_db =  Settings.getMiscVolume()
		$audio.stream = load(wateringSounds.pick_random())
		$audio.play()
		$audio.finished.connect(func():
			isPlaying = false
			)
	isWatering = true
	
func _process(delta):
	waterMeter.value = waterProgress
	
func _physics_process(delta):
	if(isWatering):
		waterProgress += 100/waterIncrease * delta
		waterProgress = clampf(waterProgress, 0,100)
		if(waterProgress==100):
			if(plant.finishedWaterLevel()):
				$leafs.texture = load("res://UI/Garden/particle.png")
				$leafs.emitting = true
				waterProgress = 0
				isWatering = false
			else:
				$leafs.texture = load("res://UI/Garden/deadParticle.png")
				$leafs.emitting = true
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
			

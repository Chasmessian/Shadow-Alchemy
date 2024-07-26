class_name World
extends Node2D

var openMenu = null
static var instance : World = null
var patient : Patient = null

static var patientCount = 0.0
const totalPatients = 2.0
const patientMaxScore = 10

static var gameInProgress = false

func _init():
	if(instance==null):
		instance = self
		patientCount = totalPatients
	else:
		queue_free()
		
func _ready():
	var fade = load("res://fade.tscn").instantiate()
	get_tree().current_scene.add_child(fade)
	fade.fadeIn(2)
	fade.done.connect(func():
		loadPatient()
		gameInProgress = true, 4)
	
func changeMenu(newMenu):
	if(openMenu!=null):
		remove_child(openMenu)
	openMenu = newMenu.instantiate()
	add_child(openMenu)
	
func closeMenu():
	if(openMenu!=null):
		remove_child(openMenu)
		openMenu = null
		
func tryPotion(potion):
	if(patient==null):
		return
	scoreTracker.points += patient.ratePotion(potion)
	print("SCORE: " + str(scoreTracker.points))
	viewport.instance.patientLeave()
	viewport.instance.patientLeft.connect(loadPatient,CONNECT_ONE_SHOT)
	
		
func loadPatient():
	if(patientCount <= 0):
		endGame()
		return
	patientCount -= 1
	patient = load(PatientList.getPatient()).new()
	print(patient.curse.name)
	print(patient)
	if(patient==null):
		return
	viewport.instance.loadPatient(patient)
func endGame():
	gameInProgress = false
	get_tree().change_scene_to_file("res://UI/End Scene/endscene.tscn")

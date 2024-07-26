class_name World
extends Node2D

var openMenu = null
static var instance : World = null
var patient : Patient = null
var score = 0
var patientCount = 2

func _init():
	if(instance==null):
		instance = self
	else:
		queue_free()
		
func _ready():
	var fade = load("res://fade.tscn").instantiate()
	get_tree().current_scene.add_child(fade)
	fade.fadeIn(2)
	fade.done.connect(func():
		loadPatient())
	
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
	score += patient.ratePotion(potion)
	print("SCORE: " + str(score))
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
	print("GAME OVER" + str(score))

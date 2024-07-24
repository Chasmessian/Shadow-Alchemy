class_name World
extends Node2D

var openMenu = null
static var instance = null
var patient = null
var score = 0
func _init():
	if(instance==null):
		instance = self
	else:
		queue_free()
func _ready():
	loadPatient()
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
	viewport.instance.arrived.connect(loadPatient,CONNECT_ONE_SHOT)
	
		
func loadPatient():
	patient = load(PatientList.getPatient()).new()
	print(patient.curse.name)
	print(patient)
	if(patient==null):
		return
	viewport.instance.loadPatient(patient)

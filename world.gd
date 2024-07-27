class_name World
extends Node2D

var openMenu = null
static var instance : World = null
var patient : Patient = null
static var patientCount = 0.0
const totalPatients = 10.0
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
		if(!scoreTracker.tutorial):
			loadPatient()
			World.gameInProgress = true
		else:
			patient = load("res://Patients/tutorialShadow/shadowtutorial.gd").new()
			viewport.instance.loadPatient(patient)
			
			, 4)
	
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
	var patientPoints = patient.ratePotion(potion)
	if(scoreTracker.tutorial):
		scoreTracker.tutorial = false
	else:
		scoreTracker.points += patientPoints
	var percentage = float(patientPoints)/float(patientMaxScore)
	print(percentage)
	var status = "decent"
	if(percentage<.3):
		status = "failed"
	elif(percentage==1):
		status = "perfect"
	print("SCORE: " + str(scoreTracker.points))
	viewport.instance.patientLeave()
	viewport.instance.patientLeft.connect(loadPatient,CONNECT_ONE_SHOT)
	ConversationMaster.instance.exitDialogue(status)
	viewport.instance.patientLeft.connect(func():
		Dialogue.instance.ending_dialogue.emit())
	
	
		
func loadPatient():
	if(patientCount <= 0):
		endGame()
		return
	patientCount -= 1
	patient = load(PatientList.getPatient()).new()
	if(patient==null):
		return
	viewport.instance.loadPatient(patient)
func endGame():
	World.gameInProgress = false
	get_tree().change_scene_to_file("res://UI/End Scene/endscene.tscn")

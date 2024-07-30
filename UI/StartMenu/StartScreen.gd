extends Control

var isReady = false
signal animation
var settingMenu = null
@onready var tutorialButton = $Tutorial
func _ready():
	animation.connect(func():
		isReady = true)

var beenPressed = false
func _on_play_pressed():
	if(beenPressed):
		return
	beenPressed = true
	playAnimation()	
	animation.connect(func():
		killMenu()
		$Fade2.fadeOut(1)
		$Fade2.done.connect(func():
			if(tutorialButton.button_pressed):
				scoreTracker.tutorial = true
			get_tree().change_scene_to_file("res://world.tscn"))
		)

func playAnimation():
	$Fade.fadeOut(1)		
	$Godot.isDropping = true
	$Control/Logo.play()
	
	#animation.emit()


func godotFell():
	#print("fell")
	$Godot.scaleTo(2,1)
	$Godot.moveTo($Center.position,1)
	
	pass # Replace with function body.


func _on_godot_done():
	get_tree().create_timer(1).timeout.connect(func():
		animation.emit()
	)
	pass # Replace with function body.


func _on_settings_pressed():
	settingMenu = load("res://UI/Settings/settingsMenu.tscn").instantiate()
	add_child(settingMenu)
	settingMenu.KILLMENOW.connect(killMenu)
	
func killMenu():
	if(settingMenu==null):
		return
	settingMenu.queue_free()
	settingMenu = null

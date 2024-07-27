class_name settingsMenu
extends Control
#provides a menu for the settings autoload
signal KILLMENOW
func _ready():
	$Panel/VBoxContainer/Dialogue.value = Settings.dialogue
	$Panel/VBoxContainer/Music.value = Settings.music
	$Panel/VBoxContainer/Misc.value = Settings.misc

func dialogueChanged(value):
	Settings.dialogueVolumeChanged(value)

func musicChanged(value):
	Settings.musicVolumeChanged(value)


func miscChanged(value):
	Settings.miscVolumeChanged(value)


func _on_exit_pressed():
	KILLMENOW.emit()

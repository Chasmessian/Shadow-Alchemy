extends Node
const default = 0.8
var dialogue = default
var music = default
var misc = default
func _init():
	Music.volume_db = volumeAlteration(default*3)

signal dialogueChanged
signal musicChanged
signal miscChanged
func dialogueVolumeChanged(value):
	dialogue = value
	dialogueChanged.emit()
func musicVolumeChanged(value):
	music = value
	Music.volume_db = getMusicVolume()
	print(Music.volume_db)
	musicChanged.emit()
func miscVolumeChanged(value):
	misc = value
	miscChanged.emit()
func getMusicVolume():
	return volumeAlteration(music*3) 
func getDialogueVolume():
	return volumeAlteration(dialogue)
func getMiscVolume():
	return volumeAlteration(misc)
func volumeAlteration(value):
	return linear_to_db(value*3)

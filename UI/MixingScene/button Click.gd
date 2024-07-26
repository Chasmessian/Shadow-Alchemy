extends AudioStreamPlayer
var isPlaying = false
var clicks = ["res://UI/ButtonClicks/Audio Track.wav", "res://UI/ButtonClicks/Audio Track-2.wav", "res://UI/ButtonClicks/Audio Track-3.wav", "res://UI/ButtonClicks/Audio Track-4.wav", "res://UI/ButtonClicks/Audio Track-5.wav", "res://UI/ButtonClicks/Audio Track-6.wav", "res://UI/ButtonClicks/Audio Track-7.wav"]
func click():
	if(isPlaying):
		return
		isPlaying = true
	stream = load(clicks.pick_random())
	play()
	finished.connect(func():
		isPlaying = false)

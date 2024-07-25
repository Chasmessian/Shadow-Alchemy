extends ColorRect
signal done
var increment = 0
var timeSpent = 0
var timer = 0
var fading = false
func fadeIn(time): #start dark
	fading = true	
	color.a = 1
	increment = -(1.0/time)
	timer = time
func fadeOut(time): #start transparent
	fading = true
	color.a = 0
	increment = 1.0/time
	timer = time
func _process(delta):
	if(fading):
		color.a += increment * delta
		timeSpent += delta
		if(timeSpent >= timer):
			fading = false
			done.emit()
	

extends ColorRect
func _ready():
	var percentage = float(scoreTracker.points)/float(World.totalPatients*World.patientMaxScore)	
	$VBoxContainer/Score/Label.text = str(percentage*100)+"%"
	$VBoxContainer/Score/Label.add_theme_color_override("font_color", Color(1-percentage,percentage,0))
	if(percentage==1.0):
		$Grade.texture = load("res://UI/End Scene/PERFECT.png")
	elif(percentage>=0.8):
		$Grade.texture = load("res://UI/End Scene/PASS.png")		
	elif(percentage>=0.5):
		$Grade.texture = load("res://UI/End Scene/MEH.png")		
	else:
		$Grade.texture = load("res://UI/End Scene/FAIL.png")		
		
		
	$VBoxContainer/Time/Label.text = str(floor(scoreTracker.time/60.0)) + ":" + str(int(scoreTracker.time)%60)

extends Node2D

var messages = [
	"Sell the water to a fish.",
	"Sell the time to a clock."
	]

var typing_speed = .025
var read_time = 2

var current_message = 0
var display = ""
var current_char = 0
var next_message_ready = false

func _ready():
	start_dialogue()

func start_dialogue():
	current_message = 0
	display = ""
	current_char = 0
	
	$next_char.set_wait_time(typing_speed)
	$next_char.start()

func stop_dialogue():
	queue_free()

func _on_next_char_timeout():
	if (current_char < len(messages[current_message])):
		var next_char = messages[current_message][current_char]
		display += next_char
		
		$Label.text = display
		current_char += 1
	else:
		$next_char.stop()
		$next_message.one_shot = true
		next_message_ready = true
		#$next_message.set_wait_time(read_time) 
		#$next_message.start()

func _on_next_message_timeout():
		if (current_message == len(messages) - 1):
			stop_dialogue()
		else:
			current_message += 1
			display = ""
			current_char = 0
			$next_char.start()
			
func clicked(): #need to call this
	if(next_message_ready):
		_on_next_char_timeout()

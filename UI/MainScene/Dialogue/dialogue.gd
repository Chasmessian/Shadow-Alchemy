class_name Dialogue
extends Node2D

static var instance = null

signal starting_dialogue
signal ending_dialogue

var messages = [
	"[Mentions completely irrelevant medical situation that happened to them as a child]",
	"[Brings it up again because dementia because old because time]"
	]

var typing_speed = .025
var read_time = 2

var current_message = 0
var display = ""
var current_char = 0
var next_message_ready = false

func _ready():
	if(instance==null):
		instance = self
	else:
		queue_free()
		#start_dialogue()

func start_dialogue():
	starting_dialogue.emit()
	current_message = 0
	display = ""
	current_char = 0
	print(messages)
		
	$next_char.set_wait_time(typing_speed)
	$next_char.start()
	
	# Add something to show the speech bubble scene.

func stop_dialogue():
	ending_dialogue.emit()
	#hide()
	# Add something to hide the speech bubble scene.
	
	#queue_free()

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

func _on_next_message_ready():
		if (current_message == len(messages) - 1):
			stop_dialogue()
		else:
			current_message += 1
			display = ""
			current_char = 0
			next_message_ready = false
			$next_char.start()

func _on_viewport_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT or event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				clicked()
				
func clicked():
	if(next_message_ready):
		_on_next_message_ready()
		
func loadDialogue(messageList):
	messages = messageList
	start_dialogue()
	
func loadConversation(convo):
	print("LOADING ")
	for i in range($ConversationHolder.get_child_count()):
		$ConversationHolder.get_child(i).queue_free()
	var convoInstance = convo.instantiate()
	$ConversationHolder.add_child(convoInstance)
	QuestionContainer.instance.loadNode(convoInstance)

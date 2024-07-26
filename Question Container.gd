class_name QuestionContainer
extends ScrollContainer
static var instance : QuestionContainer
var questionScene = preload("res://UI/MainScene/Side Dialogue Buttons/Question Button.tscn")
#var currentNode : conversation = null
signal buttonClicked(id)

func _ready():
	if(instance == null):
		instance = self
	else:
		queue_free()

func loadQuestions(convo):
	for i in range($VBoxContainer.get_child_count()):
		$VBoxContainer.get_child(i).queue_free()
	for i in range(convo.get_child_count()):
		var newQuestion = questionScene.instantiate()
		newQuestion.text = convo.get_child(i).text
		newQuestion.id = i
		newQuestion.clicked.connect(clicked)
		$VBoxContainer.add_child(newQuestion)

		
func clicked(id):
	for i in range($VBoxContainer.get_child_count()):
		$VBoxContainer.get_child(i).queue_free()
	buttonClicked.emit(id)
	
func clear():
	for i in $VBoxContainer.get_child_count():
		$VBoxContainer.get_child(i).queue_free()
	#Dialogue.instance.stop_dialogue()


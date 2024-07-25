class_name QuestionContainer
extends ScrollContainer
static var instance : QuestionContainer
var questionScene = preload("res://UI/MainScene/Side Dialogue Buttons/Question Button.tscn")
var currentNode : conversation = null

func _ready():
	if(instance == null):
		instance = self
	else:
		queue_free()

func loadNode(convo : conversation, immedientQuestions = false): #conversation node
	currentNode = convo
	Dialogue.instance.loadDialogue(convo.response)
	if(convo.isLeaf):
		Dialogue.instance.ending_dialogue.connect(loadPreviousNode, CONNECT_ONE_SHOT)
		return
	else:
		if(!immedientQuestions):
			Dialogue.instance.ending_dialogue.connect(func():
				loadQuestions(convo), CONNECT_ONE_SHOT)
		else:
			loadQuestions(convo)
func loadQuestions(convo):
	for i in range($VBoxContainer.get_child_count()):
		$VBoxContainer.get_child(i).queue_free()
	for i in range(convo.get_child_count()):
		var newQuestion = questionScene.instantiate()
		newQuestion.text = convo.get_child(i).text
		newQuestion.id = i
		newQuestion.clicked.connect(buttonClicked)
		$VBoxContainer.add_child(newQuestion)
		
func buttonClicked(id):
	for i in range($VBoxContainer.get_child_count()):
		$VBoxContainer.get_child(i).queue_free()
	print(currentNode)
	loadNode(currentNode.get_child(id))
func loadPreviousNode():
	if(currentNode == null):
		return
	loadNode(currentNode.get_parent(), true)

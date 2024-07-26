class_name ConversationMaster
extends Node
var currentConvo = null
var currentNode = null
static var instance = null

func _init():
	if(instance == null):
		instance = self
	else:
		queue_free()	

func newConversation(convoNode):
	clearConversation()
	currentConvo = convoNode.instantiate()
	add_child(currentConvo)
	currentNode = currentConvo
	loadNode(currentNode)
	playAudio()
	
func clearConversation():
	viewport.instance.audioPlayer.stop()
	currentConvo = null
	currentNode = null
	QuestionContainer.instance.clear()
	Dialogue.instance.stop_dialogue()
	pass
	
func loadNode(convoNode, immedientQuestions=false): #For when a question is asked
	currentNode = convoNode
	Dialogue.instance.loadDialogue(currentNode.response)
	if(convoNode.isLeaf):
		Dialogue.instance.ending_dialogue.connect(loadPreviousNode, CONNECT_ONE_SHOT)
		return
	else:
		if(!immedientQuestions):
			Dialogue.instance.ending_dialogue.connect(func():
				loadQuestions(convoNode), CONNECT_ONE_SHOT)
		else:
			loadQuestions(convoNode)
	pass
	
func loadPreviousNode():
	if(currentNode == null):
		return
	if(currentNode.isRoot):
		return
	loadNode(currentNode.get_parent(), true)
	
func loadQuestions(convoNode):
	print("WANTINfuG TO LOAD QUESTIONS")
	QuestionContainer.instance.loadQuestions(convoNode)
	if(!QuestionContainer.instance.buttonClicked.is_connected(manageButtonPress)):
		QuestionContainer.instance.buttonClicked.connect(manageButtonPress)	
	Node
func manageButtonPress(id):
	if(currentNode.get_child(id)==null):
		return
	loadNode(currentNode.get_child(id))
func playAudio():
	var audioPlayer = viewport.instance.audioPlayer
	audioPlayer.stream = World.instance.patient.species.vocals
	audioPlayer.seek(0)
	audioPlayer.play()

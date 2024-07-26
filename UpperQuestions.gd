extends PanelContainer

func previousConversationNode():
	ConversationMaster.instance.loadPreviousNode()
	#$VBoxContainer/UpperButtons.loadPreviousNode()
	#pass # Replace with function body.

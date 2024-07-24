extends HBoxContainer
func ChangeMode(mode):
	Garden.mode = mode
	if(mode=="plant"):
		World.instance.changeMenu(load("res://UI/Seed Selection/Seed Selection.tscn"))
func openJournal():
	World.instance.changeMenu(load("res://journal.tscn"))
func openMixing():
	World.instance.changeMenu(load("res://UI/MixingScene/Mixing.tscn"))

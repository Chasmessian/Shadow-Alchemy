extends HBoxContainer
func ChangeMode(mode):
	Garden.mode = mode
func openJournal():
	World.instance.changeMenu(load("res://journal.tscn"))
func openMixing():
	World.instance.changeMenu(load("res://UI/MixingScene/Mixing.tscn"))

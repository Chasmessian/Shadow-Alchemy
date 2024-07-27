extends HBoxContainer
func ChangeMode(mode):
	Garden.mode = mode
	if(mode=="plant"):
		World.instance.changeMenu(load("res://UI/Seed Selection/Seed Selection.tscn"))
func openJournal():
	World.instance.changeMenu(load("res://journal.tscn"))
func openMixing():
	World.instance.changeMenu(load("res://UI/MixingScene/Mixing.tscn"))

var settingMenu = null

func _on_settings_pressed():
	settingMenu = load("res://UI/Settings/settingsMenu.tscn").instantiate()
	World.instance.add_child(settingMenu)
	settingMenu.KILLMENOW.connect(killMenu)
	
func killMenu():
	if(settingMenu==null):
		return
	settingMenu.queue_free()
	settingMenu = null


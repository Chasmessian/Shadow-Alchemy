class_name World
extends Node2D

var openMenu = null
static var instance = null

func _init():
	if(instance==null):
		instance = self
	else:
		queue_free()
		
func changeMenu(newMenu):
	if(openMenu!=null):
		remove_child(openMenu)
	openMenu = newMenu.instantiate()
	add_child(openMenu)
	
func closeMenu():
	if(openMenu!=null):
		remove_child(openMenu)
		openMenu = null

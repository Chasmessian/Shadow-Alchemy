class_name conversation
extends Node
@export var isRoot : bool = false
var isLeaf : bool = false
@export var text  : String = ""
@export var response : Array = []
func _ready():
	if(get_child_count()==0 and !isRoot):
		isLeaf = true

extends Control


func _on_play_pressed():
	var fade = load("res://fade.tscn").instantiate()
	get_tree().current_scene.add_child(fade)
	fade.fadeOut(1)
	fade.done.connect(func():
		get_tree().change_scene_to_file("res://world.tscn"))

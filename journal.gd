extends Node2D

@onready var all_page_titles = ['Curse of the Example Curse', 'Curse of the Next Page']
# var all_page_content --> Can we put ALL the pages' content in an array???
@onready var current_title = $"JournalContainer/HBoxContainer/Left Page/Title"
# var current_page ?
@onready var page_number = 0

func _on_left_arrow_pressed():
	print("Journal: Left Arrow")
	change_page(-1)
	print(page_number)

func _on_right_arrow_pressed():
	print("Journal: Right Arrow")
	change_page(1)
	print(page_number)

func change_page(amount):
	page_number += amount
	page_number = clamp(page_number, 0, all_page_titles.size()-1)
	get_page(page_number)

func get_page(number):
	current_title.text = all_page_titles[number]

extends Node2D

@onready var all_page_titles_left = PackedStringArray(['Main Menu', 'Curse of Misfortune', 'Curse of Stolen Identity', 'Curse of Altered Reality'])
@onready var all_page_content_left = PackedStringArray([])
@onready var current_title_left = $"JournalContainer/HBoxContainer/Left Page/Title"
@onready var current_content_left = $"JournalContainer/HBoxContainer/Left Page/Label"
@onready var page_number = 0

func _ready():
	load_pages()

func load_pages():
	var base_path = "res://Journal Text/"
	var file_number = 1
	
	while true:
		var file_path = base_path + "page_content_" + str(file_number) + ".txt"
		var file = FileAccess.open(file_path, FileAccess.READ)
		
		if file:
			var content = file.get_as_text()
			all_page_content_left.append(content)
			file.close()
			file_number += 1
		else:
			break
	
	get_page(0)

func _on_left_arrow_pressed():
	print("Journal: Left Arrow")
	change_page(-1)
	print(page_number)

func _on_right_arrow_pressed():
	print("Journal: Right Arrow")
	change_page(1)
	print(page_number)

func change_page(amount): #Just for changing the page
	page_number += amount
	page_number = clamp(page_number, 0, all_page_titles_left.size()-1)
	get_page(page_number)

func get_page(number): # Whenever we need to update the page I guess? Journal should always start at page 0.
	current_title_left.text = all_page_titles_left[number]
	current_content_left.text = all_page_content_left[number]

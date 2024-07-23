extends Node2D

@onready var all_page_titles_left = PackedStringArray(['Main Menu', 'The Common Mould', "Ozyth's Luck", 'Curse of Echoes', 'Fireflu', 'The Transformed', 'Frozenheart', 'Merlinism', 'Pre-Possession Paranoia', 'Post-Possession Pathos', "Mambella Effect", 'Disease of Devouring', 'Deadvines', 'Lycanthropy', 'Vampirism', 'Zombification'])
@onready var all_page_content_left = PackedStringArray([])
@onready var current_title_left = $"JournalContainer/VBoxContainer/HBoxContainer/Left Page/Title"
@onready var current_content_left = $"JournalContainer/VBoxContainer/HBoxContainer/Left Page/Label"
@onready var all_page_content_right = PackedStringArray([])
@onready var current_title_right = $"JournalContainer/VBoxContainer/HBoxContainer/Right Page/Title"
@onready var current_content_right = $"JournalContainer/VBoxContainer/HBoxContainer/Right Page/Label"
@onready var page_number = 0

func _ready():
	load_pages()
	load_solutions()
	get_page(0)

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

func load_solutions():
	var base_path = "res://Journal Text/"
	var file_number = 1
	
	while true:
		var file_path = base_path + "page_solutions_" + str(file_number) + ".txt"
		var file = FileAccess.open(file_path, FileAccess.READ)
		
		if file:
			var content = file.get_as_text()
			all_page_content_right.append(content)
			file.close()
			file_number += 1
		else:
			break

func _on_left_arrow_pressed():
	change_page(-1)

func _on_right_arrow_pressed():
	change_page(1)

func _on_exit_journal_2_pressed():
	World.instance.closeMenu()

func _on_exit_journal_pressed():
	World.instance.closeMenu()

func change_page(amount): #Just for changing the page
	page_number += amount
	page_number = clamp(page_number, 0, all_page_titles_left.size()-1)
	get_page(page_number)

func get_page(number): # Whenever we need to update the page I guess? Journal should always start at page 0.
	var mandela_effect = RandomNumberGenerator.new().randi_range(1,100)
	if number == 10 and mandela_effect > 90:
			current_title_left.text = "Mambella's Effect"
			current_title_right.text = "Mambella's Effect"
	else:
		current_title_left.text = all_page_titles_left[number]
		current_title_right.text = all_page_titles_left[number]
	current_content_left.text = all_page_content_left[number]
	current_content_right.text = all_page_content_right[number]
	

extends Node2D

@onready var all_page_titles_left = PackedStringArray(['Main Menu', "About Humans and Fey", "About Desmonds and Intellijellys",'The Common Mould', "Ozyth's Luck", 'Curse of Echoes', 'Fireflu', 'The Transformed', 'Frozenheart', 'Merlinism', 'Pre-Possession Paranoia', 'Post-Possession Pathos', "Mambella Effect", 'Disease of Devouring', 'Deadvines', 'Lycanthropy', 'Vampirism', 'Zombification'])
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
	var humanInfo = FileAccess.open("res://Journal Text/HumanInfo.txt", FileAccess.READ)
	all_page_content_left.insert(1,humanInfo.get_as_text())
	humanInfo.close()
	var demonInfo = FileAccess.open("res://Journal Text/DemonInfo.txt", FileAccess.READ)
	all_page_content_left.insert(2,demonInfo.get_as_text())
	demonInfo.close()
	#Insert race info as pages 2 and 3 on both sides (but 0 indexed)

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
	var FeyInfo = FileAccess.open("res://Journal Text/FeyInfo.txt", FileAccess.READ)
	all_page_content_right.insert(1,FeyInfo.get_as_text())
	FeyInfo.close()
	var jellyInfo = FileAccess.open("res://Journal Text/IntellijellyfishInfo.txt", FileAccess.READ)
	all_page_content_right.insert(2,jellyInfo.get_as_text())
	jellyInfo.close()
	print(all_page_content_right)

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
	if number == 10:
			if(mandela_effect > 85):
				current_title_left.text = "Mambella's Effect"
				current_title_right.text = "Mambella's Effect"
			else:
				current_title_left.text = all_page_titles_left[number]
				current_title_right.text = all_page_titles_left[number]
			current_content_left.text = all_page_content_left[number]
			var solution = all_page_content_right[number]
			var dose1 = randi_range(1,8)
			var dose2 = randi_range(1,8)
			var dose3 = randi_range(1,8)
			var doses = {"dose1":dose1,"dose2" :dose2,"dose3":dose3}
			solution = solution.format(doses) #use string.format to make the solution appear different each time
			current_content_right.text = solution
			
	elif(number == 1):
		current_title_left.text = "About Humans"
		current_title_right.text = "About Fey"
		current_content_left.text = all_page_content_left[number]
		current_content_right.text = all_page_content_right[number]
	elif(number == 2):
		current_title_left.text = "About Demons"
		current_title_right.text = "About IntelliJellyfish"
		current_content_left.text = all_page_content_left[number]
		current_content_right.text = all_page_content_right[number]
	else:
		current_title_left.text = all_page_titles_left[number]
		current_title_right.text = all_page_titles_left[number]
		current_content_left.text = all_page_content_left[number]
		current_content_right.text = all_page_content_right[number]

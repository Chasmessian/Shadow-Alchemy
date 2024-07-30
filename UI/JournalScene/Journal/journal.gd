extends Node2D

@onready var all_page_titles_left = PackedStringArray(['Main Menu', "About Humans and Fey", "About Desmonds and Intellijellys",'The Common Mould', "Ozyth's Luck", 'Curse of Echoes', 'Fireflu', 'The Transformed', 'Frozenheart', 'Merlinism', 'Pre-Possession Paranoia', 'Post-Possession Pathos', "Mambella Effect", 'Disease of Devouring', 'Deadvines', 'Lycanthropy', 'Vampirism', 'Zombification'])
static var all_page_content_left = ["This journal will teach you how to cure your patients. Each patient has some curse and it is your job to figure out what it is and fix it. Talk to them, find clues, and scavenge the journal to see what matches the evidence. Then, read the instructions for the cure carefully. Enter the garden and plant the ingredients, watering them until they match what they look like in the seed selection menu. Then, mix them together precisely as the cure details.\r\n", "DESCRIPTION:\r\nHumans are the master species of the Mortal Realm. Many of them have built huge towers, grown beards, and wear big hats, giving them the power to master the realm\'s magic.\r\n\r\nALLERGIES:\r\nAll humans are allergic to shadow wood. Potatoes are the proper substitution.\r\n", "DESCRIPTION:\r\nDemons are the master species of the Realm Below. They wear dark, brooding clothing and have red skin. They also have little horns.\r\n\r\nALLERGIES:\r\nAll demons are allergic to potatoes. Shadow wood is the proper substitution.\r\n", "ORIGIN\r\nA simple and common magical illness. It is a byproduct of prolonged exposure to places with many active spells.\r\n\r\nSYMPTOMS\r\nPeople with the common mould will often have symptoms of fever, coughing, or fatigue. Symptoms will go away after a week, but in rare cases, patients may additionally report being physically unable to fall asleep until cured.\r\n", "ORIGIN\r\nA shadow curse given to people who have walked underneath ladders, opened an umbrella indoors, broken a mirror within the last seven years, or have otherwise tempted fate.\r\n\r\nSYMPTOMS\r\nSymptoms vary in severity, but include late arrivals, misplacement of important items, sudden storms, not winning the lottery, and having horrid accidents befall every person that the cursed knows and loves.\r\n", "ORIGIN\r\nA shadow curse given to people who fear that they talk too much or who fear they do not talk enough. It is given to them by their shadows, who see their thoughts.\r\n\r\nSYMPTOMS\r\nThe cursed is unable to speak freely, and is forced to repeat the last words they’ve heard spoken, thus, “the Curse of Echoes.”\r\n", "ORIGIN\r\nA shadow curse given to people who complain about it being cold. It is given to them by their shadows, who see their thoughts.\r\n\r\nSYMPTOMS\r\nPeople with fireflu will often have symptoms of fever, coughing, feeling very hot, and being thirsty. They might breathe out fire. In more severe cases of fireflu, those infected may find themselves constantly on fire. Symptoms usually disappear after about a week.\r\n", "ORIGIN\r\nA shadow curse given to those who spend too much time envying the lives of others. It is given to them by their shadows, who see their thoughts.\r\n\r\nSYMPTOMS\r\nAffected persons will likely have been transformed into another living thing, such as a mouse, a frog, or a cat, but in rarer cases they may have been transformed into inanimate objects, such as a broom or a chair. This symptom is noticeable.\r\n", "ORIGIN\r\nA shadow curse given to those who fear being too emotional, or not emotional enough, in their decision-making. It is given to them by their shadows, who see their thoughts.\r\n\r\nSYMPTOMS\r\nThose afflicted with Frozenheart will suffer occasional, fluctuating periods of extreme coldness throughout their body lasting a few hours or so. Accompanying this coldness is a complete lack of empathy and emotion for the duration. Once warmth is returned to the body, the emotion returns as well, in some cases stronger than it was before.\r\n", "ORIGIN\nA shadow curse given to those who fear aging or getting older. It is given to them by their shadows, who see their thoughts. It is most commonly found among those in the middle of their life.\n\nSYMPTOMS\nThe main symptom of Merlinism is the instantaneous aging of one’s body to be a great age, while their mind remains unaffected. The cursed will experience an intense dissatisfaction with their new body.\n", "ORIGIN\nThe paranoia that accompanies someone before they are possessed by their own shadow. This most often happens to those who dislike themselves, as the shadows will have been given the power to possess them and to erase everything they once were.\n\nSYMPTOMS\nSymptoms include excessive anxiety, difficulty sleeping, hearing breathing noises, seeing shadows that aren’t there, or having the feeling of being watched.\n", "ORIGIN\r\nWhat’s left of those who have been possessed by their shadow. The possession consumes the connection between one’s mind and identity, leaving nothing but an inner void after the shadow relinquishes the body.\r\n\r\nSYMPTOMS\r\nSymptoms include the loss of identity, relationships, passions, and memories. May also include a persistent and unnatural coldness throughout the body. If left untreated, the affected will attempt societal reintegration and forge themselves an identity anew, driven by the need to have purpose.", "ORIGIN\nWhen traveling through portals or summoning from across realms without the appropriate charms, incidental exposure to the ancient chaos may occur, altering the traveler’s perception of the world as if they were brought into a new, subtly different reality.\n\nSYMPTOMS\nSymptoms may be difficult to detect, as it may take the affected a long while before noticing anything out of the ordinary. Upon questioning, however, they will incorrectly recall the most basic of details about their reality, such as the color of the sky, song lyrics, or the names of their friends.\n", "ORIGIN\nEating food or drink outside of its realm of creation, or while performing summoning magic, may tear open an interrealmatic vortex of insatiable hunger. Thus, if you are traveling to another realm, please do not, under any circumstances, pack yourself a lunch.\n\nSYMPTOMS\nThe main symptom is the hunger that cannot be satisfied. The hunger may be unnoticeable at first, but it will increase in intensity indefinitely if left untreated. After about a week or less, the hunger becomes all-consuming and becomes physically paining, causing bodily aches and weakness.\n", "ORIGIN\nA form of invasive otherworldly vine that hides itself as a seed within food products. Upon consumption, it takes hold and begins to grow with the body, its viny tendrils making their way to the nervous system. Not native to the mortal world.\n\nSYMPTOMS\nAs the patient’s mind is being siphoned from within the body, the cursed may be unable to recall memories of their life, and their motor skills will sharply decline. As such, they may be more susceptible to falling over, causing accidents, or thinking slowly.\n", "ORIGIN\r\nThe curse of the werewolf. It is spread to the uninfected after being bitten, scratched, or by making any contact with the blood of a werewolf.\r\nSYMPTOMS\r\nSymptoms may begin at any point after initial contact. Within the first day, the cursed may report increases in their senses of smell, sight, or hearing in addition to their overall strength. Within the first three days, symptoms may extend to difficulty sleeping, an increased appetite, and a craving for flesh. After about six days, the transformation will be complete, and the werewolf will involuntarily transform into a monstrous wolf-like aberration during the nighttime.\r\n", "ORIGIN\r\nThe curse of the vampire. It is spread to the uninfected after being bitten by a vampire, and by afterwards consuming some of the vampire’s blood. Without the mutual exchange, the transformation will not occur.\r\n\r\nSYMPTOMS\r\nSymptoms begin at any point after initial contact. Within the first three days, the cursed may develop sunlight sensitivity, garlic allergies, or a craving for human blood. After about seven days, the cursed may report an increase in their senses of smell, sight, or hearing, as well as the development of fangs. After ten days, the transformation will be complete, and the vampire may now will burn in sunlight.\r\n", "ORIGIN\r\nThe curse of the undead. The curse is spread to the uninfected after being bitten by a zombie, while alive or while recently deceased. Those who have been zombified are merely reanimated corpses, and are no longer their former selves.\r\n\r\nSYMPTOMS\r\nSymptoms begin immediately after initial contact. For a living victim, there will be a sudden onset of fatigue which will gradually increase for about one to two days, after which they will fall prone and die. After about twelve hours, the cursed infection will finally take hold and begin the reanimation of the body’s organs, and the corpse will do everything in its power to spread the curse further.\r\n"]
@onready var current_title_left = $"JournalContainer/VBoxContainer/HBoxContainer/Left Page/Title"
@onready var current_content_left = $"JournalContainer/VBoxContainer/HBoxContainer/Left Page/Label"
static var all_page_content_right = ["One important thing to keep in mind is that different species are allergic to different substances. Always remember to check to make sure you are not giving them a bad cure. They will have a substitute ingredient that you will use instead. You can find these allergies on the next few pages. The curses and their cures are the remaining pages after that\n\nOne other critical detail is ALWAYS ROUND DOWN, 5/2 = 2. In cases where this would result in 0 of an ingredient, use 1 instead as you can not administer 0 of an ingredient\n", "DESCRIPTION:\r\nFey are the master species of the Realm Above. They have cute little bluish rabbitlike faces and carry around a little candle for protection. \r\n\r\nALLERGIES:\r\nAll fey are allergic to iron plants. The hob goblossom is the proper substitution.\r\n", "DESCRIPTION:\r\nIntellijellyfish are the master species of the Seventh Sea Realm, distinguished from regular jellyfish by their two eyes. They speak with a Sea-thern accent.\r\n\r\nALLERGIES:\r\nAll intellijellyfish are allergic to hob goblossom. Iron plants are the proper substitution.\r\n", "FOR ALL CASES:\r\nTo cure, please administer three (3) silver leaves in the first slot, two (2) garlic nettle in the second slot, and eight (8) dragongrass in the third slot.\r\n", "FOR HUMANS AND INTELLIJELLYFISH:\r\nTo cure, please administer three (3) goldweed, three (3) iron plants, and three (3) potatoes.\r\n\r\nFOR FEY:\r\nTo cure, please administer two (2) goldweed, two (2) iron plants, and two (2) potatoes.\r\n\r\nFOR DEMONS:\r\nTo cure, please administer four (4) goldweed, four (4) iron plants, and four (4) potatoes.\r\n", "FOR ALL CASES:\r\nTo cure, please administer four (4) harpy tongues, four (4) northern fangs, and an amount of batwort equal to the amount of patients you have treated today, if less than seven (7). If this is equal to seven (7) or greater, then only administer seven (7).\r\n", "FOR HUMANS:\r\nTo cure, please administer two (2) hob goblossoms, two (2) northern fangs, and two (2) iron plants.\r\nFOR INTELLIJELLYFISH:\r\nTo cure, please administer two (2) harpy tongues, two (2) goldweed, and two (2) garlic nettle.\r\nFOR FEY:\r\nTo cure, please administer two (2) garlic nettle, two (2) goldweed, and two (2) silver leaves.\r\nFOR DEMON:\r\nTo cure, please administer two (2) goldweed, two (2) silver leaves, and two (2) shadow wood.\r\n", "FOR THE LIVING TRANSFORMED (ANIMALS):\r\nTo cure, please administer three (3) northern fangs, ten (10) blood roses, and one (1) hob goblossom.\r\n\r\nFOR THE NONLIVING TRANSFORMED (OBJECTS):\r\nTo cure, please administer five (5) northern fangs, ten (10) blood roses, and one (1) hob goblossom.\r\n", "FOR ALL CASES:\r\nTo cure, please administer two (2) potatoes IF the patient\'s age is odd, three (3) if otherwise. Second, please administer two (2) goldweed IF the amount of full days since obtaining the curse is odd, three (3) if otherwise. Lastly, IF the number two (2) is the number two (2) in the current Eon of this Universe, then add two (2) shadow wood.\r\n", "FOR ALL CASES:\r\nTo cure, please administer one (1) northern fang for EVERY ten (10) full years the patient possesses in age, two (2) batwort, and an amount of dragongrass equal to the last digit of the current time.\r\n", "FOR ALL CASES:\r\nTo cure, please administer three (3) batwort IF the amount of full days since the curse appeared is less than one (1) week, four (4) if otherwise. Next, administer four (4) blood roses. Lastly, administer two (2) hob goblossoms IF the patient can see the things stalking them, one (1) if otherwise.\r\n", "FOR ALL CASES:\nTo cure, please administer three (3) harpy tongue. Next, administer in four (4) iron. Lastly, administer two (2) shadow wood.\n", "FOR ALL CASES:\nFirst stir in {dose1} Harpy Tongue to sharpen the memory\nNext, add in {dose2} blood rose to enhance the strength\nLast but not least, {dose3} potatos for simple nutritional value. Also some magical effects we can\'t quite seem to remember\n", "FOR ALL CASES:\r\nTo cure, please administer an amount of harpy tongues equal to the amount of full days since the curse appeared divided first by three (3) and then adding a one (1). Next, administer an amount of potatos equal to the curse\'s age in days multiplied by two (2). Lastly, administer an amount of dragongrass equal to the number of potatoes in this solution divided by the number of harpy tongues.\r\n", "FOR ALL CASES:\nTo cure, please administer between one (1) and four (4) iron plants. Secondly, administer silver leaves equal to the number five (5) minus the number of iron plants in the first slot. Lastly, administer more iron plants in the final slot equal to the amount of silver leaves multipled by two and a half (2.5).\n", "FOR ALL CASES:\r\nTo cure, please administer an amount of shadow wood equal to the number of full days since the curse appeared, then four (4) silver leaves, and two (2) northern fangs.\r\n", "FOR ALL CASES:\r\nTo cure, please administer three (3) batwort, one (1) garlic nettle for EVERY two full days the patient has had vampirism, and an amount of potatoes equal to half the amount of garlic nettles given. \r\n", "FOR MOST CASES (CHECK SPECIES-RELATED ALLERGIES):\nTo cure, please administer an amount of garlic nettles equal to the number of full days since the curse has appeared multiplied by two (2). Secondly, administer four (4) blood roses. Lastly, IF the patient is not allergic, administer two (2) hob goblossoms, otherwise, locate the appropriate substitute and administer three (3).\n"]
@onready var current_title_right = $"JournalContainer/VBoxContainer/HBoxContainer/Right Page/Title"
@onready var current_content_right = $"JournalContainer/VBoxContainer/HBoxContainer/Right Page/Label"
@onready var page_number = 0
static var lastPageOpened = 0
func _ready():
	#load_pages()
	#load_solutions()
	get_page(lastPageOpened)
	page_number = lastPageOpened

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
	#print(all_page_content_left)
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
	lastPageOpened = page_number
	get_page(page_number)

func get_page(number): # Whenever we need to update the page I guess? Journal should always start at page 0.
	var mandela_effect = RandomNumberGenerator.new().randi_range(1,100)
	if number == 12:
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

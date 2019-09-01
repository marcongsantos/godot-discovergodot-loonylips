extends Control

var player_words = []
var prompts = ["a name", "a noun", "adverb", "adjective"]
var story = "Once upon a time someone called %s ate a %s flavoured sandwich which made him all %s inside of %s"

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText

func _ready():
	DisplayText.text = "Welcome to Loony Lips! We're going to tell a story and have a wonderful time! "
	check_player_words_length()

func _on_PlayerText_text_entered(new_text):
	add_to_player_words()

func _on_TextureButton_pressed():
	add_to_player_words()
	
func add_to_player_words():
	player_words.append(PlayerText.text)
	DisplayText.text = ""
	PlayerText.clear()
	check_player_words_length()
	
func is_story_done():
	return player_words.size() == prompts.size()

func check_player_words_length():
	if is_story_done():
		tell_story()
	else: #catch all
		prompt_player()

		
func tell_story():
	DisplayText.text = story % player_words

	
func prompt_player():
	DisplayText.text += "May I Have " + prompts[player_words.size()] + " please?"









	
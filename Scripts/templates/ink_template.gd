extends Node

@onready var InkText: RichTextLabel = $LetterBackground/InkText/InkTextArea
@onready var InkChoice: VBoxContainer = $LetterBackground/InkText/ChoiceButtonArea
@onready var LuckText: RichTextLabel = $Luck
@onready var SecsText: RichTextLabel = $Seconds
@onready var MuteAmbient: Button = $MuteAmbientButton
@onready var AmbientPlayer: AudioStreamPlayer = $AmbientMusicPlayer
@onready var DialogPlayer: AudioStreamPlayer = $AudioDialogPlayer

# ############################################################################ #
# Imports
# ############################################################################ #

var InkPlayer = load("res://addons/inkgd/ink_player.gd")
@export var _loaded_story : Resource

var choice_button = load("res://Scenes/choice_button.tscn")
var story_vars = [
	"luck", "seconds"
]
var pause_Play = false

var DialogStream = AudioStream

# ############################################################################ #
# Public Nodes
# ############################################################################ #

@onready var _ink_player = InkPlayer.new()

# ############################################################################ #
# Lifecycle
# ############################################################################ #

func _ready():
	# Adds the player to the tree.
	add_child(_ink_player)

	# Replace the example path with the path to your story.
	# Remove this line if you set 'ink_file' in the inspector.
	_ink_player.ink_file = _loaded_story

	# It's recommended to load the story in the background. On platforms that
	# don't support threads, the value of this variable is ignored.
	_ink_player.loads_in_background = true

	_ink_player.loaded.connect(_story_loaded)

	# Creates the story. 'loaded' will be emitted once Ink is ready
	# continue the story.
	_ink_player.create_story()
	
	InkText.text = ''
	
	MuteAmbient.pressed.connect(_MuteAmbient)
	
	DialogStream = null

# ############################################################################ #
# Signal Receivers
# ############################################################################ #

func _story_loaded(successfully: bool):
	if !successfully:
		return

	_observe_variables()
	_bind_externals()

	_continue_story()


# ############################################################################ #
# Private Methods
# ############################################################################ #

func _continue_story():
	while _ink_player.can_continue:
		var text = _ink_player.continue_story()
		# This text is a line of text from the ink story.
		# Set the text of a Label to this value to display it in your game.
		print(text)
		
		InkText.text += " " + text + "\n"
	
	if _ink_player.has_choices:
		# 'current_choices' contains a list of the choices, as strings.
		for choice in _ink_player.current_choices:
			
			print(choice.text)
			print(choice.tags)
			
			var btn = choice_button.instantiate()
			btn.text = choice.text
			InkChoice.add_child(btn)
			
			btn.pressed.connect(_select_choice.bind(choice.index))
			# '_select_choice' is a function that will take the index of
			# your selection and continue the story.
			#_select_choice(0)
	else:
		# This code runs when the story reaches it's end.
		print("The End")

func _MuteAmbient():
	if pause_Play == true:
		AmbientPlayer.play()
		pause_Play = false
		MuteAmbient.text = "Mute ambient music"
	elif pause_Play == false:
		AmbientPlayer.stop()
		pause_Play = true
		MuteAmbient.text = "Play ambient music"
	
func _select_choice(index):
	_ink_player.choose_choice_index(index)
	
	for choice in InkChoice.get_children():
		InkText.text = ''
		choice.queue_free()
	_continue_story()


# Uncomment to bind an external function.
func _bind_externals():
	_ink_player.bind_external_function("playClip", self, "_play_Clip")
#
#func _external_function(arg1, arg2):
#	pass

#External function for playing audio
#include file path with name from root folder
func _play_Clip(name):
	if name == null:
		print(name, ": file not found")
		return
	
	print("Loading: ", name)
	DialogStream = load("res:/" + name)
	if DialogStream == null:
		return
	DialogPlayer.stop()
	DialogPlayer.stream = DialogStream
	DialogPlayer.play()

# Uncomment to observe the variables from your ink story.
# You can observe multiple variables by putting adding them in the array.
func _observe_variables():
	print("observe variables")
	_ink_player.observe_variables(story_vars, self, "_variable_changed")
#
#
func _variable_changed(variable_name, new_value):
	#ink variable check
	if variable_name == "luck":
		if LuckText.visible == false:
			LuckText.visible = true
		_updateLuck(str("Luck: ", new_value))
	if variable_name == "seconds":
		if SecsText.visible == false:
			SecsText.visible = true
		_updateSecs(str("Secs: ", new_value))
	print("Variable '%s' changed to: %s" %[variable_name, new_value])
	
func _updateLuck(new_Value):
	LuckText.text = new_Value

func _updateSecs(new_Value):
	SecsText.text = new_Value
	
func _creditsMenu():
	pass

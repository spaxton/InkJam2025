extends Node

@onready var InkText: RichTextLabel = $LetterBackground/ScrollContainer/InkText/InkTextArea
@onready var InkChoice: VBoxContainer = $LetterBackground/ScrollContainer/InkText/ChoiceButtonArea

#resource text lables
@onready var LuckText: RichTextLabel = $LetterBackground/PlayerResources/Luck
@onready var SecsText: RichTextLabel = $LetterBackground/PlayerResources/Seconds
@onready var CopTimer: Timer = $LetterBackground/PlayerResources/Timer
@onready var FocusText: RichTextLabel = $LetterBackground/PlayerResources/Focus
@onready var ResolveText: RichTextLabel = $LetterBackground/PlayerResources/Resolve
@onready var InfluenceText: RichTextLabel = $LetterBackground/PlayerResources/Influence

#buttons
@onready var MuteAmbient: Button = $LetterBackground/MuteAmbientButton
@onready var CreditsButton: Button = $LetterBackground/CreditsButton

#audio
@onready var AmbientPlayer: AudioStreamPlayer = $AmbientMusicPlayer
@onready var DialogPlayer: AudioStreamPlayer = $AudioDialogPlayer

#credits
@onready var BackButton: Button = $Credits/VBoxContainer/BackButton

# ############################################################################ #
# Imports
# ############################################################################ #

var InkPlayer = load("res://addons/inkgd/ink_player.gd")
@export var _loaded_story : Resource

var choice_button = load("res://Scenes/choice_button.tscn")
var story_vars = [
	"luck", "seconds", "resolve", "influence", "focus"
]
var pause_Play = false
var credits = false
var DialogStream = AudioStream
var playerProgress = 0

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
	_ink_player.loads_in_background = false

	_ink_player.loaded.connect(_story_loaded)

	# Creates the story. 'loaded' will be emitted once Ink is ready
	# continue the story.
	_ink_player.create_story()
	
	InkText.text = ''
	
	MuteAmbient.pressed.connect(_MuteAmbient)
	CreditsButton.pressed.connect(_credits)
	BackButton.pressed.connect(_credits)
	
	DialogStream = null
	
	CopTimer.timeout.connect(_HydeCaught)
	

func _process(delta: float):
	if Input.is_action_just_pressed("ui_cancel"):
		print("game quit")
		get_tree().quit()
	if Input.is_action_just_pressed("act2"):
		_ink_player.choose_path("act_ii")
		for choice in InkChoice.get_children():
			choice.queue_free()
		_continue_story()
	_updateSecs()

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
		
		if _ink_player.visit_count_at_path("act_i") > playerProgress:
			_actone()
		if _ink_player.visit_count_at_path("act_ii") > playerProgress:
			_acttwo()
		if _ink_player.visit_count_at_path("end") > playerProgress:
			_end()
			
		InkText.text += text + "\n"
	
	if _ink_player.has_choices:
		# 'current_choices' contains a list of the choices, as strings.
		for choice in _ink_player.current_choices:
			
			print(choice.text)
			print(choice.tags)
			
			var btn = choice_button.instantiate()
			btn.text = choice.text
			InkChoice.add_child(btn)
			
			btn.pressed.connect(_select_choice.bind(choice.index))
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
		#InkText.text = ''
		choice.queue_free()
		
	_continue_story()

# Uncomment to bind an external function.
func _bind_externals():
	_ink_player.bind_external_function("playClip", self, "_play_Clip")
#
#func _external_function(arg1, arg2):
#	pass

func _actone():
	print("act 1 visit count: ", _ink_player.visit_count_at_path("act_i"))
	FocusText.visible = true
	ResolveText.visible = true
	InfluenceText.visible = true
	CopTimer.stop()
	FocusText.text = "[color=grey]Focus: [/color]"
	ResolveText.text = "[color=blue]Resolve: [/color]"
	InfluenceText.text = "[color=yellow]Influence: [/color]"
	SecsText.visible = false
	SecsText.text = "[color=red]Secs: [/color]"
	LuckText.visible = false
	LuckText.text = "[color=green]Luck: [/color]"
	
func _acttwo():
	print("act 2 visit count: ", _ink_player.visit_count_at_path("act_ii"))
	CopTimer.start()
	SecsText.visible = true
	LuckText.visible = true
	playerProgress += 1
	
func _end():
	print("END!! visit count: ", _ink_player.visit_count_at_path("end"))
	_resetVariable()

func _HydeCaught():
	print("Hyde Caught")
	_ink_player.choose_path("act_ii.caught_end")
	for choice in InkChoice.get_children():
		choice.queue_free()
	_continue_story()
	
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

func _credits():
	if credits == false:
		print("Credits menu")
		$LetterBackground.visible = false
		$Credits.visible = true
		credits = true
	elif credits == true:
		print("Back to game")
		$LetterBackground.visible = true
		$Credits.visible = false
		credits = false
	
# Uncomment to observe the variables from your ink story.
# You can observe multiple variables by putting adding them in the array.
func _observe_variables():
	print("observe variables")
	_ink_player.observe_variables(story_vars, self, "_variable_changed")
#
#
func _resetVariable():
	InkText.text = ''
	CopTimer.stop()
	playerProgress = 0
	FocusText.visible = false
	FocusText.text = "[color=grey]Focus: [/color]"
	ResolveText.visible = false
	ResolveText.text = "[color=blue]Resolve: [/color]"
	InfluenceText.visible = false
	InfluenceText.text = "[color=yellow]Influence: [/color]"
	SecsText.visible = false
	SecsText.text = "[color=red]Secs: [/color]"
	LuckText.visible = false
	LuckText.text = "[color=green]Luck: [/color]"
	
func _variable_changed(variable_name, new_value):
	if variable_name == null:
		return
	#ink variable check
	#if variable_name == "act_i":
	#	_actone()
	#if variable_name == "act_ii":
	#	_acttwo()
	print("Variable '%s' changed to: %s" %[variable_name, new_value])
	
func _updateSecs():
	SecsText.text = str("Secs: %0.1f" %CopTimer.time_left)

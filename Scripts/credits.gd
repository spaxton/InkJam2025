extends CanvasLayer

@onready var backButton: Button = $LetterBackground/CreditsButton

func _ready():
	backButton.pressed.connect(_back)

func _back():
	$".".visible = false

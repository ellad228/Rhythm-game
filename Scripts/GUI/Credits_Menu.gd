extends Control
class_name Credits_Menu

@onready var parent = get_parent()

@export var credits : Label
@export var credits_path : String

func _ready():
	var file = FileAccess.open(credits_path, FileAccess.READ)
	credits.text = file.get_as_text()

func _on_back_button_up():
	visible = false
	parent.main_Menu.visible = true

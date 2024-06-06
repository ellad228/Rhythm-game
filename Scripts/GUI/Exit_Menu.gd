extends Control
class_name Exit_Menu

@onready var parent = get_parent()

func _on_yes_button_up():
	get_tree().quit()

func _on_no_button_up():
	visible = false
	parent.main_Menu.visible = true

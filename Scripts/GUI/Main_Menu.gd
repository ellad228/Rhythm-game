extends Control
class_name Main_Menu

@onready var parent = get_parent()

func _on_start_button_up():
	visible = false
	parent.level_Select.visible = true

func _on_settings_button_up():
	visible = false
	parent.settings_Menu.visible = true

func _on_credits_button_up():
	visible = false
	parent.credits_Menu.visible = true

func _on_exit_button_up():
	visible = false
	parent.exit_Menu.visible = true
	

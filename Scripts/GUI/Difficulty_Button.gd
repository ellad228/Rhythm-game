extends Button

signal difficulty_select(difficulty)

var difficulty : String = text


func _on_button_up():
	emit_signal("difficulty_select", difficulty)
	for i in get_parent().get_children():
		if i != self:
			i.button_pressed = true
		else:
			button_pressed = false

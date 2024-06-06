extends Button

signal level_select(level)

@export var level : Script
@export var music : AudioStreamMP3


func _on_button_up():
	emit_signal("level_select", level)

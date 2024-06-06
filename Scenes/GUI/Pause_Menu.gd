extends Control
class_name Pause_Menu

@onready var parent = get_parent()

@export var start_Screen : PackedScene
@export var game : PackedScene

func _on_continue_button_up():
	get_tree().paused = false
	visible = false

func _on_retry_button_up():
	get_tree().paused = false
	visible = false
	parent.game.queue_free()
	var instance = game.instantiate()
	parent.add_child(instance)

func _on_exit_button_up():
	get_tree().paused = false
	var instance = start_Screen.instantiate()
	get_tree().root.add_child(instance)
	get_parent().queue_free()




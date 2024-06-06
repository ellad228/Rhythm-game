extends Node
class_name Root

@export var game : Game
@export var level_Finish : Level_Finish
@export var pause_Menu : Pause_Menu



func _physics_process(delta):
	if Input.is_action_just_pressed("escape"):
		pause_Menu.visible = true
		get_tree().paused = true

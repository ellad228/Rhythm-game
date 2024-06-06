extends Node2D
class_name Game

@export var level_Map : Level_Map
@export var conductor : Conductor
@export var ui : UI

@onready var parent : Root = get_parent()

func _enter_tree():
	conductor = $Conductor
	level_Map.get_score.connect(_on_get_score)
	ui.Start_Button.button_down.connect(_on_start_button_down)

func _on_start_button_down():
	Start()

func Setup():
	level_Map.Load_Map()

func Start():
	conductor.play()

func _on_get_score(value):
	ui.Score_Counter.text = str(value)


func Level_Finish_Setup(accuracy : float, score : int, Name : String):
	level_Map._physics_process(false)
	conductor._physics_process(false)
	parent.level_Finish.Set_Stats(accuracy, score, Name)
	parent.level_Finish.visible = true
	visible = false

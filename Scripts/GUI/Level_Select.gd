extends Control
class_name Level_Select

@export var game_Path : String

@export var level_Name : Label
@export var difficulty_label : Label
@export var high_Score : Label
@export var accuracy : Label
@export var level_stats : VBoxContainer
@export var level_Buttons : VBoxContainer

@onready var parent = get_parent()

var game : PackedScene
var map
var difficulty : String = "Normal"

func _enter_tree():
	if !Score.levels_Arr.size() > 0:
		for i in level_Buttons.get_children():
			Score.levels_Arr.append(i.level.new())
			Music.music_Array.append(i.music)
			print(i.music)
	print(Score.levels_Arr)
	print(Music.music_Array)
	game = load(game_Path)
	level_stats.visible = false

func Update(Name : String, Score : float, Accuracy : float):
	level_Name.text = Name
	high_Score.text = str(Score)
	accuracy.text = str(Accuracy * 100.0) + "%"
	difficulty_label.text = difficulty

func _on_play_button_up():
	var instance = game.instantiate()
	#instance.back_Point = scene
	for i in Score.levels_Arr:
		if level_Name.text == i.level_Name:
			instance.game.level_Map.map = i
		
	instance.level_Finish.difficulty = difficulty
	instance.game.level_Map.difficulty = difficulty
	print(instance.game.level_Map.difficulty)
	get_tree().root.add_child(instance)
	instance.game.Setup()
	get_parent().queue_free()

func _on_back_button_up():
	visible = false
	parent.main_Menu.visible = true

func _on_level_button_level_select(level):
	level_stats.visible = true
	map = level

	var instance = map.new()
	for i in Score.levels_Arr:
		if i.level_Name == instance.level_Name:
			if difficulty=="Easy":
				Update(i.level_Name, i.easy_Score, snappedf(i.easy_Accuracy, 0.01))
			elif difficulty=="Normal":
				Update(i.level_Name, i.normal_Score, snappedf(i.normal_Accuracy, 0.01))
			elif difficulty=="Hard":
				Update(i.level_Name, i.hard_Score, snappedf(i.hard_Accuracy, 0.01))

func _on_difficulty_select(Difficulty):
	difficulty = Difficulty

	var instance = map.new()
	for i in Score.levels_Arr:
		if i.level_Name == instance.level_Name:
			if difficulty=="Easy":
				Update(i.level_Name, i.easy_Score, snappedf(i.easy_Accuracy, 0.01))
			elif difficulty=="Normal":
				Update(i.level_Name, i.normal_Score, snappedf(i.normal_Accuracy, 0.01))
			elif difficulty=="Hard":
				Update(i.level_Name, i.hard_Score, snappedf(i.hard_Accuracy, 0.01))

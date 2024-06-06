extends Control
class_name Level_Finish

@export var accuracy_label : Label
@export var score_Label : Label
@export var difficulty_Label : Label
@export var start_Screen : PackedScene

var difficulty : String

func Set_Stats(accuracy : float, score : int, Name : String):
	difficulty_Label.text = difficulty
	for i in Score.levels_Arr:
		if i.level_Name == Name:
			if difficulty == "Easy":
				i.easy_Score = score
				i.easy_Accuracy = accuracy
			elif difficulty == "Normal":
				i.normal_Score = score
				i.normal_Accuracy = accuracy
			elif difficulty == "Hard":
				i.hard_Score = score
				i.hard_Accuracy = accuracy
	print(difficulty)
	
	accuracy_label.text = str(snappedf(accuracy * 100.0, 1)) + "%"
	score_Label.text = str(score)
	Score.Save_Score()

func _on_back_button_up():
	var instance = start_Screen.instantiate()
	get_tree().root.add_child(instance)
	get_parent().queue_free()

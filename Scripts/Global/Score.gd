extends Node

const ANDROID_SCORE_PATH = "/storage/emulated/0/Android/data/com.ellad228/files/score.txt"
const WINDOWS_SCORE_PATH = "res://User_Data/Saves/score.txt"

var level_Name = ""
var easy_Score = 0
var easy_Accuracy : float = 0
var normal_Score = 0
var normal_Accuracy : float = 0
var hard_Score = 0
var hard_Accuracy : float = 0

var levels_Arr : Array

var score_Data : Array = []
#var score_Data : Array = [
#["level_Name", level_Name],
#["score", score],
#["accuracy", accuracy],]

func _ready():
	var j = 0
	print(snappedf(0.45384, 0.01))
	for i in levels_Arr:
		i.music = Music.music_Array[j]
		j+=1
		
		
	Load_Settings(Save.load_data(score_Data, WINDOWS_SCORE_PATH))

func Default():
	for i in levels_Arr:
		score_Data += [
		["level_Name", i.level_Name],
		["easy_Score", easy_Score],
		["easy_Accuracy", easy_Accuracy],
		["normal_Score", normal_Score],
		["normal_Accuracy", normal_Accuracy],
		["hard_Score", hard_Score],
		["hard_Accuracy", hard_Accuracy],
		]

func Load_Settings(values : Array):
	var counter = 0
	if values.size() > 0:
		for i in levels_Arr:
			i.easy_Score = snappedf(values[1+counter], 0.01)
			i.easy_Accuracy = snappedf(values[2+counter], 0.01)
			i.normal_Score = snappedf(values[3+counter], 0.01)
			i.normal_Accuracy = snappedf(values[4+counter], 0.01)
			i.hard_Score = snappedf(values[5+counter], 0.01)
			i.hard_Accuracy = snappedf(values[6+counter], 0.01)
			counter += 7

func Save_Score():
	for i in levels_Arr:
		score_Data += [
		["level_Name", i.level_Name],
		["easy_Score", snappedf(i.easy_Score, 0.01)],
		["easy_Accuracy", snappedf(i.easy_Accuracy, 0.01)],
		["normal_Score", snappedf(i.normal_Score, 0.01)],
		["normal_Accuracy", snappedf(i.normal_Accuracy, 0.01)],
		["hard_Score", snappedf(i.hard_Score, 0.01)],
		["hard_Accuracy", snappedf(i.hard_Accuracy, 0.01)],
		]
		print(score_Data)
	Save.save_data(score_Data, WINDOWS_SCORE_PATH)
	

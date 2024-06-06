extends Node

@export var music : AudioStreamMP3
var level_Name = "Second_level"
var easy_Score = 0
var easy_Accuracy : float = 0
var normal_Score = 0
var normal_Accuracy : float = 0
var hard_Score = 0
var hard_Accuracy : float = 0

var bpm = 130

var first_timing = 0.05
var second_timing = 0.1
var third_timing = 0.15

var spawn_delay = 0.5

var spawn_speed = 1
var empty_beats = 16


var beat_Array : Array = [
[ 0, 7.5, 15],
[ 6.5, 14],
[ 5.5, 13],
[ 4.5, 12],
[ 3.5, 11],
[ 2.5, 10],
[ 1.5, 19],
[ 0.5, 8],
]



var hit_Array : Array = [
[943, 453], [1405, 679], [322, 556],
[1663, 138], [1649, 231],

[1523, 932], [238, 894], [381, 525], [519, 957], 
[643, 954],

[1538, 829], [570, 431], [762, 315], [760, 364], 
[553, 886], [1428, 584], [939, 607],
]

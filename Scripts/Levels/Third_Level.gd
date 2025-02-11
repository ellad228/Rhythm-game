extends Node

@export var music : AudioStreamMP3
var level_Name = "Third_level"
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
[ 0, 4, 8, 11.5, 12],
[ 0, 4, 8, 11.5, 12],
[ 0, 2, 3.5, 4, 6, 7, 8, 8.5, 10, 11.5, 12, 14, 15],
[ 0, 2, 3.5, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 15.5 ],

[ 0, 3.5, 6, 7, 8, 10.5, 11.5],
[ 0, 3.5, 6, 7, 8, 10.5, 11.5],
[ 0, 3.5, 6, 7, 8, 10.5, 11.5],
[ 0, 3.5, 6, 7, 8, 10.5, 11.5],
[ 0, 2.5, 3.5, 8, 10.5, 11.5],
[ 0, 2.5, 3.5, 8, 10.5, 11.5],
[ 0, 3.5, 6, 7, 8, 10.5, 11.5],
[ 0, 3.5, 6, 7, 8, 10.5, 11.5],
[ 0, 3.5, 6, 7, 8, 10.5, 11.5],
[ 0, 3.5, 6, 7, 8, 10.5, 11.5],
[ 0, 4, 8, 11.5, 12],
[ 0, 2, 3.5, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 15.5 ],
]

var hit_Array : Array = [
[943, 453], [1405, 679], [322, 556], [1663, 138], [1649, 231],

[1523, 932], [238, 894], [381, 525], [519, 957], [643, 954],

[1538, 829], [570, 431], [762, 315], [760, 364], [553, 886], [1428, 584], [939, 607], [1032, 725], [1593, 163], [373, 132],
[427, 183], [980, 89], [938, 925],

[1277, 279], [511, 780], [524, 261], [522, 205], [1316, 804], [509, 514], [1288, 479], [751, 548], [705, 1004], [1087, 766], 
[751, 548], [1045, 383], [729, 151], [862, 585], [908, 583],

[509, 495], [776, 724], [1558, 818], [1575, 427], [938, 102], [1266, 478], [972, 476],
[295, 471], [688, 947], [1035, 146], [441, 804], [985, 634], [1624, 303], [1716, 599],
[1421, 883], [534, 899], [1570, 316], [1101, 748], [862, 408], [382, 677], [375, 481], 
[473, 201], [1653, 222], [1010, 343], [439, 546], [1536, 658], [1111, 892], [713, 894], 

[1656, 602], [1452, 361], [1416, 677], [463, 490], [843, 331], [364, 766], 
[328, 452], [1248, 313], [756, 855], [813, 508], [1203, 881], [1627, 438],

[597, 323], [625, 785], [1140, 292], [1161, 794], [911, 571], [933, 139], [907, 847], 
[968, 808], [1352, 662], [722, 400], [1184, 288], [1064, 495], [1259, 453], [669, 652], 
[350, 740], [517, 446], [1218, 621], [782, 878], [908, 439], [1062, 779], [1025, 656], 
[1638, 386], [1358, 328], [614, 322], [678, 579], [922, 480], [1138, 520], [897, 765],

[1523, 932], [238, 894], [381, 525], [519, 957], [643, 954],

[1277, 279], [511, 780], [524, 261], [522, 205], [1316, 804], [509, 514], [1288, 479], [751, 548], [705, 1004], [1087, 766], 
[751, 548], [1045, 383], [729, 151], [862, 585], [908, 583],
]

extends Node2D
class_name Level_Map

signal get_score(value : int)

@export var hit_Circle : PackedScene

@onready var parent : Game = get_parent()

var map
var level_Name
var difficulty
var hit_Map : Array
var beat_Map : Array
var conductor : Conductor

var note = 0
var measure_note = 0
var measure = 0
var beats_played = 0

var score = 0
var accuracy : float = 0
var max_Score

var first_timing_in_beats
var second_timing_in_beats
var third_timing_in_beats

var spawn_delay
var spawn_delay_in_beats

var resolution_x = 1920.0
var resolution_y = 1080.0

var played = false

func _ready():
	conductor = parent.conductor
	print(conductor)

func Load_Map():
	var counter = 0
	level_Name = map.level_Name
	conductor.stream = map.music
	conductor.bpm = map.bpm
	conductor.sec_per_beat = 60.0/ conductor.bpm
	print(conductor.bpm)
	print(conductor.sec_per_beat)
	hit_Map = map.hit_Array
	beat_Map = map.beat_Array
	print("hit_array: ", hit_Map.size())
	var size = 0
	for arr in beat_Map:
		size += beat_Map[counter].size()
		counter += 1
	print("beat_array: ", size)
	
	beats_played = map.empty_beats
	
	spawn_delay = map.spawn_delay / map.spawn_speed
	
	first_timing_in_beats = map.first_timing / conductor.sec_per_beat
	second_timing_in_beats = map.second_timing / conductor.sec_per_beat
	third_timing_in_beats = map.third_timing / conductor.sec_per_beat
	
	if difficulty == "Easy":
		print(spawn_delay_in_beats)
		spawn_delay *= 1.3
		first_timing_in_beats *= 1.1
		second_timing_in_beats *= 1.1
		third_timing_in_beats *= 1.1
		print(spawn_delay_in_beats)
	elif difficulty == "Hard":
		spawn_delay *= 0.8
		first_timing_in_beats *= 0.9
		second_timing_in_beats *= 0.9
		third_timing_in_beats *= 0.9
		
	spawn_delay_in_beats = spawn_delay / conductor.sec_per_beat
	
	counter = 0
	for cord in hit_Map:
		#Объявляем экземпляр кружка
		var hit_instance = hit_Circle.instantiate()
		
		#Добавляем экземпляр кружка к уровню 
		add_child(hit_instance)
		
		if difficulty == "Easy":
			hit_instance.scale *= 1.1
		elif difficulty == "Hard":
			hit_instance.scale *= 0.9
			
		hit_instance.Setup()
		hit_instance.z_index = hit_Map.size() - counter
		hit_instance.collision_priority = hit_Map.size() - counter
		hit_instance.beat = beat_Map[measure][measure_note]
		measure_note += 1
		counter += 1
		if measure_note == beat_Map[measure].size():
			measure += 1
			measure_note = 0
			
		hit_instance.position.x = cord[0] * (get_viewport().content_scale_size.x / resolution_x)
		hit_instance.position.y = cord[1] * (get_viewport().content_scale_size.y / resolution_y)
	
	measure = 0
	measure_note = 0
	counter = 0
	
	for i in get_children():
		print(i)
		print(i.z_index)
	print("Map ready!")

func Activate_Note():
	get_child(note).Turn_On()
	note += 1
	measure_note += 1
	accuracy = score / (note * 300.0)
	if measure_note == beat_Map[measure].size():
		beats_played += conductor.measures
		measure_note = 0
		measure += 1
	if measure == beat_Map.size():
		set_physics_process(false)
	
func Score_Increase(grade : String):
	if grade == "Cool":
		score += 300
		get_score.emit(score)
	elif grade == "Great":
		score += 200
		get_score.emit(score)
	elif grade == "OK":
		score += 100
		get_score.emit(score)
	elif grade == "Damn...":
		score += 50
		get_score.emit(score)

	
func _physics_process(delta):
	if conductor.playing:
		#print(beat_Map[measure][measure_note])
		if beat_Map[measure][measure_note] + beats_played - spawn_delay_in_beats <= conductor.song_position_in_beats:
			print("spawned")
			print(beat_Map[measure][measure_note] + beats_played - spawn_delay_in_beats)
			print(conductor.song_position_in_beats)
			Activate_Note()
		if Input.is_action_just_pressed("mouse_button_left"):
			played = true


func _on_conductor_finished():
	parent.Level_Finish_Setup(accuracy, score, level_Name)

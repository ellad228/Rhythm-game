extends Area2D
class_name Hit_Circle

@export var appear : SpriteFrames
@export var fade : SpriteFrames
@export var animation : AnimatedSprite2D
@export var audio_Player : AudioStreamPlayer
var parent : Level_Map
var conductor : Conductor

var mouse_in = false

var beat : float = 0
var play_beat : float

var ftib
var stib
var ttib

var animation_time 

func Setup():
	animation_time = appear.get_frame_count("default") / appear.get_animation_speed("default")
	animation.speed_scale = animation_time / parent.spawn_delay
	ftib = parent.first_timing_in_beats
	stib = parent.second_timing_in_beats
	ttib = parent.third_timing_in_beats
	audio_Player.volume_db = Conductor.Percent_To_DB(Settings.sfx * 2)

func Turn_Off():
	input_pickable = false
	
func Turn_On():
	set_physics_process(true)
	input_pickable = true
	visible = true
	Appear()

func Appear():
	animation.sprite_frames = appear
	animation.play()

func Fade():
	animation.sprite_frames = fade
	animation.play()

func Played():
	Turn_Off()
	Fade()
	print("played")
	play_beat = conductor.song_position_in_beats
	print(play_beat)
	print(beat + parent.beats_played)
	if play_beat >= beat + parent.beats_played - ftib and play_beat <= beat + parent.beats_played + ftib:
		parent.Score_Increase("Cool")
		audio_Player.play()
	elif play_beat >= beat + parent.beats_played - stib and play_beat <= beat + parent.beats_played + stib:
		parent.Score_Increase("Great")
	elif play_beat >= beat + parent.beats_played - ttib and play_beat <= beat + parent.beats_played + ttib:
		parent.Score_Increase("OK")
	parent.played = false

func _on_mouse_entered():
	mouse_in = true

func _on_mouse_exited():
	mouse_in = false

func _physics_process(delta):
	if mouse_in == true and Input.is_action_just_pressed("mouse_button_left") and parent.played == true:
		Played()

func _enter_tree():
	Turn_Off()
	visible = false
	parent = get_parent()
	conductor = parent.conductor

func _on_animated_sprite_2d_animation_finished():
	if animation.sprite_frames == appear:
		Fade()
		
	elif animation.sprite_frames == fade:
		Turn_Off()
		visible = false
		set_physics_process(false)

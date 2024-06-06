extends AudioStreamPlayer
class_name Conductor

@export var bpm := 100
@export var measures := 16

# Tracking the beat and song position
var song_position = 0.0
var song_position_in_beats = 0
var current_beat = 1
var sec_per_beat = 60.0 / bpm
var last_reported_beat = 0
var beats_before_start = 0
var _measure = 1

# Determining how close to the beat an event is
var closest = 0
var time_off_beat = 0.0

signal beat(position)
signal measure(position)

static func Percent_To_DB(percent : float):
	var scale : float = 20.0
	var divisor = 50.0
	return scale * (log(percent / divisor) / log(10))

func _enter_tree():
	sec_per_beat = 60.0 / bpm
	print(sec_per_beat)
	#play()

func _ready():
	volume_db = Percent_To_DB(Settings.music_Volume)

func _physics_process(_delta):
	if playing:
		song_position = get_playback_position() + AudioServer.get_time_since_last_mix()
		song_position -= AudioServer.get_output_latency()
		current_beat = int(floor(song_position / sec_per_beat))
		#song_position_in_beats = (song_position / sec_per_beat) + beats_before_start
		song_position_in_beats = (song_position / sec_per_beat)
		_report_beat()

func _report_beat():
	if last_reported_beat < current_beat:
		if _measure > measures - 1:
			_measure = 0
			emit_signal("measure", measure)
		emit_signal("beat", current_beat)
		#emit_signal("measure", measure)
		last_reported_beat = current_beat
		_measure += 1

func closest_beat(nth):
	closest = int(round((song_position / sec_per_beat) / nth) * nth) 
	time_off_beat = abs(closest * sec_per_beat - song_position)
	return Vector2(closest, time_off_beat)

func play_with_beat_offset(num):
	beats_before_start = num
	$StartTimer.wait_time = sec_per_beat
	$StartTimer.start()

func play_from_beat(beat, offset):
	play()
	seek(beat * sec_per_beat)
	beats_before_start = offset
	_measure = beat % measures

func _on_StartTimer_timeout():
	current_beat += 1
	if current_beat < beats_before_start - 1:
		$StartTimer.start()
	elif current_beat == beats_before_start - 1:
		$StartTimer.wait_time = $StartTimer.wait_time - (AudioServer.get_time_to_next_mix() + AudioServer.get_output_latency())
		$StartTimer.start()
	else:
		play()
		$StartTimer.stop()
	_report_beat()


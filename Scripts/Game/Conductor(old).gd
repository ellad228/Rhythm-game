extends AudioStreamPlayer

@export var BPM : float
var SPB : float
var SP : float


func _ready():
	SPB = 60 / BPM
	print(SPB)
	play()


func _process(delta):
	SP = get_playback_position() + AudioServer.get_time_since_last_mix()
	# Compensate for output latency.
	SP -= AudioServer.get_output_latency()
	print("Time is: ", SP)

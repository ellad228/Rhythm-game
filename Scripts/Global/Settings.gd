extends Node

const ANDROID_SETTINGS_PATH = "/storage/emulated/0/Android/data/com.ellad228/files/settings.txt"
const WINDOWS_SETTINGS_PATH = "res://User_Data/Saves/settings.txt"

var music_Volume : float = 50
var sfx : float = 50

var settings_Data : Array = [
["music_Volume", music_Volume],
["sfx", sfx],
]

func _ready():
	Load_Settings(Save.load_data(settings_Data, WINDOWS_SETTINGS_PATH))

func Load_Settings(values : Array):
	music_Volume = values[0]
	sfx = values[1]

func Save_Settings():
	settings_Data = [
["music_Volume", music_Volume],
["sfx", sfx],
]
	Save.save_data(settings_Data, WINDOWS_SETTINGS_PATH)

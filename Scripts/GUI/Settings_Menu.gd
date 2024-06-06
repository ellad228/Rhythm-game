extends Control
class_name Settings_Menu

@onready var parent = get_parent()

@onready var music_Volume_Slider : HSlider = $MarginContainer/TabContainer/Audio/MarginContainer/GridContainer/HBoxContainer/MusicVolume
@onready var sfx_Slider : HSlider = $MarginContainer/TabContainer/Audio/MarginContainer/GridContainer/HBoxContainer2/SFX

@onready var music_Volume_Percent : Label = $MarginContainer/TabContainer/Audio/MarginContainer/GridContainer/HBoxContainer/Percent
@onready var sfx_Percent : Label = $MarginContainer/TabContainer/Audio/MarginContainer/GridContainer/HBoxContainer2/Percent

var music_Volume : float
var sfx : float

func _ready():
	music_Volume_Percent.text = str(Settings.music_Volume) + "%"
	music_Volume_Slider.value = Settings.music_Volume
	sfx_Percent.text = str(Settings.sfx) + "%"
	sfx_Slider.value = Settings.sfx
	print(sfx_Percent.text)

func _on_music_volume_value_changed(value):
	music_Volume_Percent.text = str(value) + "%"
	music_Volume = value

func _on_sfx_value_changed(value):
	sfx_Percent.text = str(value) + "%"
	sfx = value


func _on_save_button_up():
	Settings.music_Volume = music_Volume
	Settings.sfx = sfx
	Settings.Save_Settings()
	visible = false
	parent.main_Menu.visible = true

func _on_cancel_button_up():
	music_Volume = Settings.music_Volume
	sfx = Settings.sfx
	music_Volume_Slider.value = music_Volume
	sfx_Slider.value = sfx
	visible = false
	parent.main_Menu.visible = true

func _on_set_to_default_button_up():
	music_Volume = 50
	sfx = 50
	music_Volume_Slider.value = 50
	sfx_Slider.value = 50
	

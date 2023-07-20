extends Control

@onready var global_vars = get_node("/root/Global")

var master_bus = AudioServer.get_bus_index("Master")

func _ready():
	$VolumeSlider.value = global_vars.volume


func _process(delta):
	pass


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")



func _on_easy_pressed():
	$Selected.set_text("Selected: Easy \n- 200 Health \n- Higher Damage \n- 150% Oxygen")
	global_vars.difficulty = 1


func _on_medium_pressed():
	$Selected.set_text("Selected: Medium \n- 100 Health \n- Medium Damage \n- 100% Oxygen")
	global_vars.difficulty = 2


func _on_hard_pressed():
	$Selected.set_text("Selected: Hard \n- 50 Health \n- Less Damage \n- 70% Oxygen")
	global_vars.difficulty = 3
	


func _on_music_slider_value_changed(value):
	global_vars.volume = $VolumeSlider.value
	AudioServer.set_bus_volume_db(master_bus,value)
	if value == -30:
		AudioServer.set_bus_mute(master_bus, true)
	else:
		AudioServer.set_bus_mute(master_bus, false)

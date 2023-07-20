extends Control

@onready var global_vars = get_node("/root/Global")
# Called when the node enters the scene tree for the first time.
var master_bus = AudioServer.get_bus_index("Master")
func _ready():
	pass

func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/loading_screen.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/Options.tscn")


func _on_quit_game_pressed():
	get_tree().quit()


func _on_about_pressed():
	get_tree().change_scene_to_file("res://Scenes/about.tscn")


func _on_achievements_pressed():
	get_tree().change_scene_to_file("res://Scenes/Achievements.tscn")

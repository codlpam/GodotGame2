extends Control

@onready var global_vars = get_node("/root/Global")

var is_paused = false:
	get: return(is_paused)
	set(value): 
		is_paused = value 
		get_tree().paused = is_paused 
		visible = is_paused
	

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused

func _on_resume_pressed():
	self.is_paused = false
	
func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
	global_vars.life = 3
	global_vars.score = 0 
	self.is_paused = false

func _on_quit_game_pressed():
	get_tree().quit()

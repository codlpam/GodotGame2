extends Control

@onready var global_vars = get_node("/root/Global")


func _ready():
	$Score.set_text("Score: " + str(global_vars.score))
	$Enemies.set_text("Enemies Killed: " + str(global_vars.EnemiesKilled))
	$Time.set_text("Time Taken: " + str(_format_seconds(global_vars.time)))
	if global_vars.score >= 100:
		global_vars.scoreAchievement = true


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
	global_vars.enemyAttacking = false
	global_vars.healthUpgradeCost = 1
	global_vars.oxygenUpgradeCost = 1
	global_vars.damageUpgradeCost = 1 

func _on_quit_game_pressed():
	get_tree().quit()
	
func _format_seconds(time : float) -> String:
	var minutes := time / 60
	var seconds := fmod(time, 60)
	return "%02d:%02d" % [minutes, seconds]

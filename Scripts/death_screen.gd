extends Control

@onready var global_vars = get_node("/root/Global")


func _ready():
	if global_vars.oxygen <= 0:
		$YouDied.set_text("You Ran Out Of Oxygen")
	else:
		$YouDied.set_text("You Died!")
	$Score.set_text("Score: " + str(global_vars.score))
	if global_vars.score >= 100:
		global_vars.scoreAchievement = true


func _on_retry_pressed():
	get_tree().change_scene_to_file("res://Scenes/Intro.tscn")
	global_vars.score = 0
	global_vars.oxygen = 100
	global_vars.life = 100
	global_vars.enemyAttacking = false
	global_vars.healthUpgradeCost = 1
	global_vars.oxygenUpgradeCost = 1
	global_vars.damageUpgradeCost = 1 


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
	global_vars.score = 0
	global_vars.oxygen = 100
	global_vars.life = 100
	global_vars.enemyAttacking = false
	global_vars.healthUpgradeCost = 1
	global_vars.oxygenUpgradeCost = 1
	global_vars.damageUpgradeCost = 1 

func _on_quit_game_pressed():
	get_tree().quit()
	

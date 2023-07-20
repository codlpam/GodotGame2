extends Control

@onready var global_vars = get_node("/root/Global")
# Called when the node enters the scene tree for the first time.
func _ready():
	if global_vars.scoreAchievement == true:
		$ScoreAchievement/Score/Coin.texture = load("res://Sprites/Coin/Coin_0000000.png")
	else:
		$ScoreAchievement/Score/Coin.texture = load("res://Images/coingrey.png")
	
	if global_vars.collectablesAchievement == true:
		$"Collectables Achievement/Collectables/Oxygen".texture = load("res://Images/oxygentank.png")
	else:
		$"Collectables Achievement/Collectables/Oxygen".texture = load("res://Images/oxygengrey.png")
		
	if global_vars.enemiesAchievement == true:
		$EnemyAchievement/Enemies/Sword.texture = load("res://Images/sword.png")
	else:
		$EnemyAchievement/Enemies/Sword.texture = load("res://Images/swordgrey.png")



func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")

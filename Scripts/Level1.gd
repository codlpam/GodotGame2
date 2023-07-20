extends Node

@onready var global_vars = get_node("/root/Global")
var end = false

func _ready():
	global_vars.notify = null
	if global_vars.difficulty == 1:
		global_vars.life = 200
		global_vars.maxHealth = 200
		global_vars.maxOxygen = 150
		global_vars.oxygen = 150
		global_vars.damage = 80
	elif global_vars.difficulty == 2:
		global_vars.life = 100
		global_vars.maxHealth = 100
		global_vars.maxOxygen = 100
		global_vars.oxygen = 100
		global_vars.damage = 50
	else:
		global_vars.life = 50
		global_vars.maxHealth = 50
		global_vars.maxOxygen = 70
		global_vars.oxygen = 70
		global_vars.damage = 30
	global_vars.score = 0
	global_vars.time = 0 
	global_vars.coins = 0
	

func _process(delta):
	if end == true and Input.is_action_pressed("Enter"):
		get_tree().change_scene_to_file("res://Scenes/Level2.tscn")

	
func _on_portal_end_body_entered(body):
	if "Player" in body.name:
		global_vars.notify = "Press Enter to Proceed"
		end = true

func _on_portal_end_body_exited(body):
	if "Player" in body.name:
		end = false

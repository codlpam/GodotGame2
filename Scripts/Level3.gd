extends Node

@onready var global_vars = get_node("/root/Global")
var canPilot = false


func _process(delta):
	if canPilot == true and Input.is_action_pressed("Enter"):
		get_tree().change_scene_to_file("res://Scenes/BossLevel.tscn")


func _on_exit_body_entered(body):
	if "Player" in body.name:
		global_vars.notify = "Press Enter to Pilot"
		canPilot = true


func _on_exit_body_exited(body):
	if "Player" in body.name:
		canPilot = false
	
		


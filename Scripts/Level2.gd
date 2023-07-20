extends Node

@onready var global_vars = get_node("/root/Global")
var end = false


func _process(delta):
	if end == true and Input.is_action_pressed("Enter"):
		get_tree().change_scene_to_file("res://Scenes/Level3.tscn")


func _on_portal_body_entered(body):
	if "Player" in body.name:
		global_vars.notify = "Press Enter to Proceed"
		end = true


func _on_portal_body_exited(body):
	if "Player" in body.name:
		end = false

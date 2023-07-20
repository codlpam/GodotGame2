extends Node

@onready var global_vars = get_node("/root/Global")
# Called when the node enters the scene tree for the first time.
func _ready():
	$EndAnim.play("EndAnim")


func _on_end_anim_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://Scenes/game_complete.tscn")

extends CanvasLayer

@onready var global_vars = get_node("/root/Global")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Boss/ProgressBar.value = global_vars.enemyShipHealth
	$Player/ProgressBar2.value = global_vars.shipHealth
	
	
	if global_vars.shipHealth <= 0:
		get_tree().change_scene_to_file("res://Scenes/death_screen.tscn")

extends Area2D

@onready var global_vars = get_node("/root/Global")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		global_vars.notify = "Oxygen Collected +20"
		global_vars.score += 5
		global_vars.oxygen += 20
		global_vars.collected += 1 
		if global_vars.collected >= 34:
			global_vars.collectablesAchievement = true
		if global_vars.oxygen > global_vars.maxOxygen:
			global_vars.oxygen = global_vars.maxOxygen
		queue_free()

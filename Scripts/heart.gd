extends Area2D

@onready var global_vars = get_node("/root/Global")


func _process(_delta):
	$AnimationPlayer.play("colorChange")


func _on_body_entered(body):
	if body.name == "Player":
		global_vars.notify = "Health Collected +20"
		global_vars.score += 5
		global_vars.life += 20
		global_vars.collected += 1 
		if global_vars.collected >= 34:
			global_vars.collectablesAchievement = true
		if global_vars.life > 100:
			global_vars.life = 100
		queue_free()


extends Area2D

@onready var global_vars = get_node("/root/Global")

@export var move_speed = 1
@export var move_distance = 4
@export var move_direction = Vector2(0,1)

var time_since_init = 0
var origin = Vector2(0,0)
var collected = false

func _ready():
	time_since_init = 0.0
	origin = position
	pass

func _process(delta):
	$Coin.play("default")
	time_since_init = time_since_init + delta
	var position_on_curve = sin(time_since_init * PI * move_speed)
	var offset = move_direction * position_on_curve * move_distance
	position = origin + offset 


func _on_body_entered(body):
	if body.name == "Player" and collected == false:
		$Pickup.play()
		global_vars.notify = "Coin Collected +1"
		global_vars.score += 5
		global_vars.coins += 1
		global_vars.collected += 1 
		collected = true
		$Coin.hide()
		if global_vars.collected >= 34:
			global_vars.collectablesAchievement = true


func _on_pickup_finished():
	queue_free()

extends CharacterBody2D


@onready var global_vars = get_node("/root/Global")
const projectilepath = preload("res://Scenes/Projectile.tscn")
const speed = 500
var input : Vector2
var canShoot = true
var shooting = false

@onready var ShootTimer = $ShootTimer
@export var ShootDelay: float = 0.6

func _physics_process(delta):
	playerShipMovement()
	shoot()
	if shooting == true:
		$Ship/Weapon.play("shooting")
	else:
		$Ship/Weapon.play("idle")
	$Ship/Booster.play("default")
	velocity = input * speed
	move_and_slide()
	
	
func playerShipMovement():
	input.y = Input.get_axis("ui_up", "ui_down")
	input.x = Input.get_axis("ui_left", "ui_right")
	input = input.normalized()
	
func shoot():
	if Input.is_action_just_pressed("Attack") and canShoot == true: 
		var projectile = projectilepath.instantiate()
		get_parent().add_child(projectile)
		projectile.position = $Marker2D.get_global_position()
		$ShootTimer.start()
		shooting = true
		canShoot = false 
		

func _on_shoot_timer_timeout():
	shooting = false
	canShoot = true


func _on_hit_box_body_entered(body):
	if body.name == "EnemyProjectile":
		global_vars.shipHealth -= 10
		body.queue_free()
		

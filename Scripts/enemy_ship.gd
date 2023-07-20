extends CharacterBody2D

@onready var global_vars = get_node("/root/Global")

const SPEED = 200
var moveDirection = Vector2.ZERO
var area_position = Vector2(-940, -540)
var area_size = Vector2(840, 1070)
var targetPosition = Vector2.ZERO

const enemyprojectilepath = preload("res://Scenes/EnemyProjectile.tscn")
var fireTimer = 0.0

const FIRE_RATE_MIN = 0.1
const FIRE_RATE_MAX = 1.0

func _ready():
	$EnemyShip/Exhaust.play("default")
	moveDirection = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	chooseNewTarget()

func _process(delta):
	var velocity = moveDirection * SPEED * delta
	move_and_collide(velocity)
	
	if position.distance_to(targetPosition) < 10:
		chooseNewTarget()
		
	fireTimer -= delta
	if fireTimer <= 0.0:
		fireBullet()
		fireTimer = randf_range(FIRE_RATE_MIN, FIRE_RATE_MAX)
#	
		
func chooseNewTarget():
	targetPosition = Vector2(randf_range(area_position.x, area_position.x + area_size.x), randf_range(area_position.y, area_position.y + area_size.y))
	moveDirection = (targetPosition - position).normalized()

func fireBullet():
	var newBullet = enemyprojectilepath.instantiate()
	get_parent().add_child(newBullet)
	newBullet.position = $Marker2D.get_global_position()


func _on_hitbox_body_entered(body):
	if body.name == "Projectile":
		$Damage.play()
		body.queue_free()
		global_vars.enemyShipHealth -= 10
		if global_vars.enemyShipHealth <= 0:
			get_tree().change_scene_to_file("res://Scenes/EndAnimation.tscn")
		

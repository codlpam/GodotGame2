extends CharacterBody2D

@onready var global_vars = get_node("/root/Global")

const speed = 90
var move = false
@export var health = 120
var playerInRange = false
var canTakeDamage = true
var takingDamage = false
@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D


func _ready() -> void:
	global_vars.playerAttacking = false
	makepath()

func _physics_process(_delta: float) -> void:
	damage()
	update_health()
	if health <= 0:
		$Sprite2D.play("Death")
		if $Sprite2D.animation == "Death" && $Sprite2D.frame == 4:
			queue_free()
			global_vars.score += 5
	elif takingDamage == true:
		$Sprite2D.play("Damaged")
		if $Sprite2D.animation == "Damaged" && $Sprite2D.frame == 5:
			takingDamage = false
	elif global_vars.enemyAttacking == true:
		$Sprite2D.play("Attack")
	elif move == true:
		var direction = to_local(nav_agent.get_next_path_position()).normalized()
		velocity = direction * speed
		move_and_slide()
		$Sprite2D.play("Run")
		if velocity > Vector2(0,-1) and velocity > Vector2(0,1):
			$Sprite2D.flip_h = false
		else:
			$Sprite2D.flip_h = true
	else:
		$Sprite2D.play("Idle")
		
func update_health():
	var healthbar = $Healthbar
	healthbar.value = health
	
func makepath() -> void:
	nav_agent.target_position = player.global_position
	
		
func _on_timer_timeout():
	makepath()

func _on_detection_area_body_entered(body):
	if "Player" in body.name:
		move = true

func _on_escape_area_body_exited(body):
	if "Player" in body.name:
		move = false
		$Sprite2D.play("Idle")


func _on_hitbox_body_entered(body):
	if "Player" in body.name:
		playerInRange = true


func _on_hitbox_body_exited(body):
	if "Player" in body.name:
		playerInRange = false
		

func damage(): # taking damage , player attacking enemy 
	if playerInRange and global_vars.playerAttacking == true:
		if canTakeDamage == true:
			$Hurt.play()
			takingDamage = true
			health = health - global_vars.damage
			$TakeDamage.start()
			canTakeDamage = false
			if health <= 0:
				move = false
				global_vars.EnemiesKilled += 1 
				if global_vars.EnemiesKilled >= 33:
					global_vars.enemiesAchievement = true


func _on_take_damage_timeout():
	canTakeDamage = true




extends CharacterBody2D


@onready var global_vars = get_node("/root/Global")

@export var enemyDamage = 10
var speed = 110
const friction = 150
var input : Vector2

var EnemyAttack = false

@onready var EnemyAttackTimer = $EnemyAttack

@onready var TakeDamageTimer = $TakeDamage
@export var TakeDamageDelay: float = 2

@onready var CanAttackTimer = $CanAttack
@export var CanAttackDelay: float = 0.5
var canAttack = true

func _physics_process(_delta):
	enemyAttack()
	attack()
	playerMovement()
	if global_vars.playerAttacking == true:
		$PlayerSprite.play("Attack1")
	elif velocity.x != 0 or velocity.y != 0:
		$PlayerSprite.play("run")
		
	else:
		#if global_vars.playerAttacking == false:
		$PlayerSprite.play("idle")
	velocity = input * speed
	move_and_slide()
	
	if global_vars.life == 0:
		get_tree().change_scene_to_file("res://Scenes/death_screen.tscn")
	

func playerMovement():
	input.x = Input.get_axis("ui_left", "ui_right")
	input.y = Input.get_axis("ui_up", "ui_down")
	input = input.normalized()
	if input.x > 0:
		$PlayerSprite.flip_h = false
	elif input.x < 0:
		$PlayerSprite.flip_h = true


func _on_player_hitbox_body_entered(body):
	if "Enemy" in body.name:
		EnemyAttack = true


func _on_player_hitbox_body_exited(body):
	if "Enemy" in body.name:
		EnemyAttack = false


func enemyAttack(): # enemy attacking / Taking Damage 
	if EnemyAttack == true and TakeDamageTimer.is_stopped():
		global_vars.life -= enemyDamage
		global_vars.enemyAttacking = true
		$Damaged.play("modulate")
		#print(global_vars.life)
		EnemyAttackTimer.start()
		TakeDamageTimer.start()
		$Hurt.play()
		
		
func attack():
	if Input.is_action_just_pressed("Attack") and canAttack == true:
		CanAttackTimer.start()
		global_vars.playerAttacking = true
		canAttack = false


func _on_can_attack_timeout():
	#print("can attack")
	canAttack = true
	global_vars.playerAttacking = false
	
func _on_enemy_attack_timeout():
	global_vars.enemyAttacking = false




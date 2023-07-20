extends Node

@onready var life = 10000: 
	get: return(life)
	set(value): life = value

@onready var score = 0:
	get: return(score)
	set(value): score = value
	
var notify:
	get: return notify
	set(value): notify = value
	
var oxygen = 100:
	get: return oxygen
	set(value): oxygen = value
	
var coins = 0:
	get: return coins
	set(value): coins = value

var maxHealth = 100:
	get: return maxHealth
	set(value): maxHealth = value
	
var maxOxygen = 100:
	get: return maxOxygen
	set(value): maxOxygen = value
	
var damage = 50:
	get: return damage
	set(value): damage = value
	
var shipHealth = 250:
	get:return shipHealth
	set(value): shipHealth = value
	
var enemyShipHealth = 300:
	get:return enemyShipHealth
	set(value): enemyShipHealth = value
	
var playerAttacking = false
var enemyAttacking = false
var time = 0.0
var volume = -15
var difficulty = 2
var EnemiesKilled = 0
var healthUpgradeCost = 1
var oxygenUpgradeCost = 1
var damageUpgradeCost = 1 

var scoreAchievement = false
var enemiesAchievement = false
var collectablesAchievement = false
var collected = 0

func _ready():
	pass
		
	



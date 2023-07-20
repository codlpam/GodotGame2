extends CanvasLayer

@onready var global_vars = get_node("/root/Global")

@onready var Oxygentick = $OxygenTickDown
@export var Oxygentickspeed: float = 2

var upgradesShowing = false
var time_elapsed := 0.0

func _ready():
	$Health/Healthbar.max_value = global_vars.maxHealth
	$Upgrades/HealthCost.set_text(str(global_vars.healthUpgradeCost))
	$Upgrades/OxygenCost.set_text(str(global_vars.oxygenUpgradeCost))
	$Upgrades/DamageCost.set_text(str(global_vars.damageUpgradeCost))

func _process(delta):
	$Score/Score.set_text("Score: " + str(global_vars.score))
	$Oxygen/Oxygen.set_text(str(global_vars.oxygen) + "%")
	$Coins/coins.set_text(str(global_vars.coins))
	update_health()
	global_vars.time += delta
	$Time/Stopwatch.set_text("Time: " + str(_format_seconds(global_vars.time)))
	
	if Input.is_action_just_pressed("Upgrades"):
		upgradesMenu()
		if upgradesShowing == false:
			upgradesShowing = true
		else:
			upgradesShowing = false

func _on_oxygen_tick_down_timeout():
	global_vars.oxygen -= 1
	Oxygentick.start(Oxygentickspeed)
	if global_vars.oxygen == 0:
		get_tree().change_scene_to_file("res://Scenes/death_screen.tscn")
	
func update_health():
	var healthbar = $Health/Healthbar
	healthbar.value = global_vars.life


func upgradesMenu():
	if upgradesShowing == false:
		$Upgrades.show()
		$CloseMenu.show()
		$OpenMenu.hide()
	else:
		$Upgrades.hide()
		$CloseMenu.hide()
		$OpenMenu.show()

func _on_upgrade_health_pressed():
	if global_vars.coins >= global_vars.healthUpgradeCost:
		$Health/Healthbar.max_value = global_vars.maxHealth
		global_vars.notify = "Health Upgraded"
		global_vars.coins -= global_vars.healthUpgradeCost
		global_vars.maxHealth += 20
		global_vars.life += 10
		global_vars.healthUpgradeCost += 1
		$Upgrades/HealthCost.set_text(str(global_vars.healthUpgradeCost))
	else:
		global_vars.notify = "Not Enough Coins"


func _on_upgrade_oxygen_pressed():
	if global_vars.coins >= global_vars.oxygenUpgradeCost:
		global_vars.notify = "Oxygen Upgraded"
		global_vars.coins -= global_vars.oxygenUpgradeCost
		global_vars.maxOxygen += 20
		global_vars.oxygen += 10
		global_vars.oxygenUpgradeCost += 1
		$Upgrades/OxygenCost.set_text(str(global_vars.oxygenUpgradeCost))
	else:
		global_vars.notify = "Not Enough Coins"


func _on_upgrade_damage_pressed():
	if global_vars.coins >= global_vars.damageUpgradeCost:
		global_vars.notify = "Damage Upgraded"
		global_vars.coins -= global_vars.damageUpgradeCost
		global_vars.damage += 10
		global_vars.damageUpgradeCost += 1
		$Upgrades/DamageCost.set_text(str(global_vars.damageUpgradeCost))
	else:
		global_vars.notify = "Not Enough Coins"
		
		
func _format_seconds(time : float) -> String:
	var minutes := time / 60
	var seconds := fmod(time, 60)
	return "%02d:%02d" % [minutes, seconds]

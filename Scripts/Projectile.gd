extends CharacterBody2D

const speed = 2000
var vel = Vector2(-1,0)

func _physics_process(delta):
	$Sprite2D.play("default")
	move_and_collide(vel * delta * speed)


func _on_collision_body_entered(body):
	if "WallLeft" in body.name:
		queue_free()

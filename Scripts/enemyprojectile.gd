extends CharacterBody2D


const speed = 2000
var vel = Vector2(1,0)

func _physics_process(delta):
	move_and_collide(vel * delta * speed)
	$Sprite2D.play("default")


func _on_collision_body_entered(body):
	if "WallRight" in body.name:
		queue_free()

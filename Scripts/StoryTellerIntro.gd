extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_body_entered(body):
	if "Player" in body.name:
		$StoryBox.visible = true
	pass


func _on_body_exited(body):
	if "Player" in body.name:
		$StoryBox.visible = false
	pass

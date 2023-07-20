extends Control


@onready var global_vars = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel.hide()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global_vars.notify != null:
		$Panel.show()
		$Panel/Label.set_text(str(global_vars.notify))
		$ShowAnimation.play("Show")
		global_vars.notify = null

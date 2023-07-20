extends Panel


@export var skip_to_scene = ""
@export var story_line_file = ""

@onready var stsNode = get_node("SkipToScene")
@onready var cbNode = get_node("ChatBox")

func _ready():
	stsNode._loadSkipToScene(skip_to_scene)
	cbNode._loadDialogFromFile(story_line_file)
	if get_tree().current_scene.name == "Level3":
		$SkipToScene.hide()
	else:
		$SkipToScene.show()
	pass

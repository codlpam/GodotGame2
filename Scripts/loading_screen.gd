extends CanvasLayer

@export var scene: String = "res://Scenes/Intro.tscn"
@onready var progressbar: ProgressBar = $ProgressBar
var progress = []
var scene_load_status = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	ResourceLoader.load_threaded_request(scene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	scene_load_status = ResourceLoader.load_threaded_get_status(scene,progress)
	progressbar.value = progress[0] * 100
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		$ContinueButton.visible = true


func _on_continue_button_pressed():
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(scene))
		queue_free()
	else:
		print("scene not loaded")

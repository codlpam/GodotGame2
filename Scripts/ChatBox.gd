extends Label

var drawTextSpeed: int = 0
var chatterLimit: int = 100
var dialog = []

	
var skip_to_scene
var page = 0

func _loadDialogFromFile(fname):
	var f = FileAccess.open(fname, FileAccess.READ)
	var index = 1
	while not f.eof_reached():
		var line = f.get_line()
		dialog.append(line)
		index += 1
	f.close()
	
	set_text(dialog[page])
	pass

func _ready():
	#set_autowrap(true)
	pass

func _showChatter():
	if drawTextSpeed < chatterLimit:
		drawTextSpeed +=1
		self.visible_characters = drawTextSpeed
	pass
	
func _process(_delta):
	_showChatter()
	pass

func _on_skip_lines_pressed():
	if page < dialog.size()-1:
		page +=1
		set_text(dialog[page])
	else:
		page = 0
		set_text(dialog[page])
		
	drawTextSpeed = 0
	_showChatter()
	pass



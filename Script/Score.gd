extends Node2D

var font

func _ready():
	var label = Label.new()
	font = label.get_font("")
	label.queue_free()
	
func _draw():
	draw_string(font, Vector2(30, 0), str(Global.score))
	

extends Node2D

var font
var text

func _ready():
	var label = Label.new()
	font = label.get_font("")
	label.queue_free()
	
func _draw():
	
	text = 'Score: ' + str(Global.score)
	draw_string(font, Vector2(30, 0), text, Color( 1, 0.65, 0, 1 ))
	
func _process(delta):
	update() 

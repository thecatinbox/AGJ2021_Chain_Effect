extends Node2D

var font
var text

var dynamic_font = DynamicFont.new()
var label = Label.new()

func _ready():

	dynamic_font.font_data = load("res://Font/AlloyInk.ttf")
	dynamic_font.size = 50
	dynamic_font.outline_size = 3
	dynamic_font.outline_color = Color( 1, 0.65, 0, 1 )
	dynamic_font.use_filter = true
	
	label.add_font_override("font", dynamic_font)
	label.queue_free()
	
func _draw():
	
	text = 'Score: ' + str(Global.score) + '/' + str(Global.number / 2)
	draw_string(dynamic_font, Vector2(20, 0), text)
	
func _process(delta):
	update() 

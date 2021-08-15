extends Node2D

var wave = Vector2()
var angle = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	angle += PI/72
	
	wave.x = get_position().x
	wave.y = cos(angle) * 10
	self.position = wave
	

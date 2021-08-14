extends Node2D
var dir = Vector2(0, -1)
var count = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = Global.BGPos
	count = Global.BGPosCount
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	pass
	self.position += dir.rotated(rotation)
	count += 1
	
	if count >= 1046: 
		self.position -= 1046 * dir.rotated(rotation)
		count = 0
		
	Global.BGPos = self.position
	Global.BGPosCount = count

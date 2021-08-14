extends Node2D

var create = false 
var circle = load("res://Scene/Circles.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		if not create: 
			play() 
			create = true 

func play(): 
	var c = circle.instance()
	c.position = get_global_mouse_position()
	c.notMoving = true
	get_parent().add_child(c)


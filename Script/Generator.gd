extends Node

var start = true
var number = 40 
var speed = 1
var circle = load("res://Scene/Circles.tscn")

var rndX
var rndY

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var c = circle.instance()
	c.position = Vector2(1024 / 2, 300)# get_global_mouse_position()
	c.notMoving = true
	get_parent().add_child(c)
	
	for i in range(0, number): 
		spawn() 

func _process(delta):
	if start: 
		for i in range(number): 
			spawn() 
		start = false

func spawn(): 

	var c = circle.instance()
	
	rndX = rand_range(0, 1024)
	rndY = rand_range(0, 600)
	
	c.position =  Vector2(rndX, rndY)
	c.dir = speed * (Vector2(rand_range(-1, 1), rand_range(-1, 1))).normalized()
	get_parent().add_child(c)


extends Node

var start = true
var number = 40 
var speed = 200
var circle = load("res://Scene/Circles.tscn")

var rndX
var rndY

func _process(delta):
	if start: 
		for i in range(number): 
			spawn() 
		start = false
		
	print(Global.score)

func spawn(): 

	var c = circle.instance()
	
	rndX = rand_range(0, 1024)
	rndY = rand_range(0, 600)
	
	c.position =  Vector2(rndX, rndY)
	c.velocity = speed * (Vector2(rand_range(-1, 1), rand_range(-1, 1))).normalized()
	get_parent().add_child(c)


extends Node

var start = true

var circle = load("res://Scene/Circles.tscn")
var music = load("res://Music/Music.ogg")

var rndX
var rndY

func _ready():
	randomize() 
	Global.number = 2 * (randi() % 15 + 10)
	Global.speed = randi() % 200 + 100
	
	$AudioStreamPlayer2D.stream = music
	$AudioStreamPlayer2D.play(Global.musicPos)

func _process(delta):

	if start: 
		for i in range(Global.number): 
			spawn() 
		start = false
		
	Global.musicPos = $AudioStreamPlayer2D.get_playback_position()

func spawn(): 

	var c = circle.instance()
	
	rndX = randi() % 1024
	rndY = randi() % 600
	
	c.position =  Vector2(rndX, rndY)
	c.velocity = Global.speed * (Vector2(rand_range(-1, 1), rand_range(-1, 1))).normalized()
	get_parent().add_child(c)


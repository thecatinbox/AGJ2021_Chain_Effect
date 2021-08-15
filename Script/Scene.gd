extends Node2D

var create = false 
var circle = load("res://Scene/Circles.tscn")
var sound = preload("res://Music/meow.wav")

var result = false
var win = load("res://Scene/Win.tscn")
var lose = load("res://Scene/Lose.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.score = 0
	Global.level += 1

	pass 

func _process(delta):
	OS.window_size = Vector2(1024,600)
	# Global.audioPos = $AudioStreamPlayer2D.get_playback_position()
	
	if create == true && result == false: 
		
		var refresh = true
		
		for ball in get_tree().get_nodes_in_group("circles"):
			
			if ball.notMoving == true: 
				refresh = false 
				
		if refresh == true: 
			
			if Global.score >= Global.number / 2: 
				var v = win.instance()
				v.position =  Vector2(512, 300)
				get_parent().add_child(v)
				result = true
			else: 
				var v = lose.instance()
				v.position =  Vector2(512, 300)
				get_parent().add_child(v)
				result = true
				

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		if not create: 
			play() 
			
			$AudioStreamPlayer2D.stream = sound
			$AudioStreamPlayer2D.play()
			
			create = true 

func play(): 
	var c = circle.instance()
	c.position = get_global_mouse_position()
	c.notMoving = true
	get_parent().add_child(c)



func _on_StartButton_pressed():
	get_tree().change_scene("res://Scene/Scene.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()

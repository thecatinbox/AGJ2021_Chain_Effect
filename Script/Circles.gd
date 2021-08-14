extends KinematicBody2D

var velocity = Vector2(0, 0)
var type = "CIRCLE"

var notMoving = false
var scl = 1

var destroy = false 
var timer = 60

var catType = randi() % 3 + 1
var startSprite
var transSprite
var endSprite

var sound = preload("res://Music/meow.wav")

func _ready():
	
	if catType == 1: 
		startSprite = load("res://Image/cat1_1.png")
		transSprite = load("res://Image/cat1_2.png")
		endSprite = load("res://Image/cat1_3.png")
	elif catType == 2: 
		startSprite = load("res://Image/cat2_1.png")
		transSprite = load("res://Image/cat2_2.png")
		endSprite = load("res://Image/cat2_3.png")
	elif catType == 3: 
		startSprite = load("res://Image/cat3_1.png")
		transSprite = load("res://Image/cat3_2.png")
		endSprite = load("res://Image/cat3_3.png")
	
	$Sprite.texture = startSprite
	

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if notMoving: 
		
		velocity = Vector2(0, 0)
		disappear() 

	else: 

		if collision: 
			velocity = velocity.bounce(collision.normal)
			
			if collision.get_collider().type == "CIRCLE" and collision.get_collider().notMoving == true:  
				notMoving = true
				Global.score += 1 
				
				$AudioStreamPlayer2D.stream = sound
				$AudioStreamPlayer2D.play()
			
		look_at(position + velocity)
		
func disappear(): 
	scale = Vector2(scl, scl)
	if not destroy:
		if scl < 3:  
			scl += 0.5
			$Sprite.texture = transSprite
		else: 
			timer -= 1
			$Sprite.texture = endSprite
			if timer <= 0: 
				destroy = true
	else: 
		if scl > 0:  
			$Sprite.texture = startSprite
			scl -= 0.5
		else: 
			queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()



extends KinematicBody2D

var velocity = Vector2(0, 0)
var type = "CIRCLE"

var notMoving = false
var scl = 1

var destroy = false 
var timer = 150

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if notMoving: 
		
		if collision:
			if collision.get_collider().type == "CIRCLE" and collision.get_collider().notMoving == false: 
				collision.get_collider().notMoving = true
				collision.get_collider().velocity = Vector2(0, 0)
				Global.score += 1
		
		disappear() 
		
	else: 

		if collision: # and collision.get_collider().type == "WALL":
			velocity = velocity.bounce(collision.normal)
		
func disappear(): 
	scale = Vector2(scl, scl)
	if not destroy:
		if scl < 4:  
			scl += 0.5
		else: 
			timer -= 1
			if timer <= 0: 
				destroy = true
	else: 
		if scl > 0:  
			scl -= 0.5
		else: 
			queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

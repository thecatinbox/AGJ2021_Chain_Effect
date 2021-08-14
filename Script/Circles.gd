extends KinematicBody2D

var dir = Vector2(1, 0)
var velocity
var type = "CIRCLE"

var notMoving = false
var scl = 1

var destroy = false 
var timer = 150

func _physics_process(delta):
	velocity = dir.rotated(rotation)
	
	if not notMoving: 
		self.position += dir.rotated(rotation)
	else: 
		var collision = move_and_collide(velocity * delta)
		
		if collision:
			if collision.get_collider().type == "CIRCLE" and collision.get_collider().notMoving == false: 
				collision.get_collider().notMoving = true
				Global.score += 1
			else: 
				velocity = velocity.bounce(collision.normal)
		
		
		disappear() 
		
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

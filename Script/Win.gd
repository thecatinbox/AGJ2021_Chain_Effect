extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(Global.score)
	print(Global.number)
	if Global.score == Global.number: 
		$AnimatedSprite.play("perfect")
	else: 
		$AnimatedSprite.play("win")


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):



func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed(): 
		get_tree().reload_current_scene()
		queue_free() 

extends Area2D
var sound = preload("res://Music/meow.wav")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed(): 
		$AudioStreamPlayer2D.stream = sound
		$AudioStreamPlayer2D.play()
		

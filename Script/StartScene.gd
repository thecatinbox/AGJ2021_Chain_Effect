extends Node2D

var circle = load("res://Scene/Circles.tscn")
var sound = preload("res://Music/meow.wav")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	OS.window_size = Vector2(1024,600)
	# Global.audioPos = $AudioStreamPlayer2D.get_playback_position()




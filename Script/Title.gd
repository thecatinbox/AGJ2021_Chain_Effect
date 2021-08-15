extends Node2D

var create = false 
var circle = load("res://Scene/Circles.tscn")
var sound = preload("res://Music/meow.wav")

var result = false
var win = load("res://Scene/Win.tscn")
var lose = load("res://Scene/Lose.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

func _process(delta):
	OS.window_size = Vector2(1024,600)
	# Global.audioPos = $AudioStreamPlayer2D.get_playback_position()
				

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scene/Scene.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()

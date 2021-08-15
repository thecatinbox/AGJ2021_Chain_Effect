extends Node2D

var music = load("res://Music/Music.ogg")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.stream = music
	$AudioStreamPlayer2D.play(Global.musicPos)
	pass 

func _process(delta):
	OS.window_size = Vector2(1024,600)
	Global.musicPos = $AudioStreamPlayer2D.get_playback_position()

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scene/Scene.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()

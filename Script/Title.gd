extends Node2D

var music = load("res://Music/Music.ogg")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.stream = music
	# Global.musicPos = 0
	$AudioStreamPlayer.play(Global.musicPos) # 
	pass 

func _process(delta):
	OS.window_size = Vector2(1024,600)

func _on_StartButton_pressed():
	Global.musicPos = $AudioStreamPlayer.get_playback_position()
	get_tree().change_scene("res://Scene/Scene.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()

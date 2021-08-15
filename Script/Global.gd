extends Node

var start = 1

var score = 0
var level = 0

var number = 40
var speed = 150

var audioPos = 0

var BGPos = Vector2(0, 0)
var BGPosCount = 0
var musicPos = 0.000

var highScore = 0

func _ready():
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

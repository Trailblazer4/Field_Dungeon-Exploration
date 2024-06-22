extends Node2D

@onready var pauseMenu = $TextureRect

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_U):
		GameData.q[2] = true
		print(GameData.q)
		pass

	if Input.is_key_pressed(KEY_L):
		visible = false
		get_tree().paused = false
		GameData.transition(1, 0)

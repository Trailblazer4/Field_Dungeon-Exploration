extends Node2D

# idea for fadeout/fadein: use signals for whether to fade out or fade in certain black screens
# when the main game's black box.a >= 1, emit a signal to the pause menu to decrease its black box.a to <= 0

var pauseQ # states the pause screen can be in (main pause screen, searching through items, settings, looking at party; 4 states)
var cursor = 0

@onready var current_scene = get_parent().get_child(get_parent().get_child_count() - 1)
# Called when the node enters the scene tree for the first time.
func _ready():
	GameData.fadeScreen(self).visible = true
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameData.pausing and GameData.fadeScreen(self).color.a > 0:
		GameData.fadeScreen(self).color.a -= delta * 4
	elif !GameData.pausing:
		GameData.fadeScreen(self).color.a += delta * 4
	#get_tree().current_scene = self
	#if Input.is_action_pressed("up"):
		#$Sprite2D.modulate /= 2
	#if Input.is_action_pressed("down"):
		#$Sprite2D.modulate *= 2
	#if Input.is_action_pressed("left"):
		#$Sprite2D.modulate /= 1.3
	#if Input.is_action_pressed("right"):
		#$Sprite2D.modulate *= 1.3
	if Input.is_key_pressed(KEY_L):
		GameData.pausing = false
		GameData.fadeout = false
		GameData.fadein = true

	if !GameData.pausing and GameData.fadeScreen(self).color.a >= 1:
		get_tree().paused = false
		visible = false
		current_scene.visible = true
		GameData.transition(1, 0)
		camera().enabled = false
		current_scene.get_node("Party/Party1/Camera2D").enabled = true
		cursor = 0
		$Highlight.position.y = 74

	


func camera():
	return $Camera2D

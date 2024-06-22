extends Node2D

@onready var party = get_node("Party").get_children()
var nextLevel = load("res://Dungeon.tscn") # or preload, either seems to work fine
# Called when the node enters the scene tree for the first time.

var fadeout = false

func _ready():
	GameData.current_scene = self
	PauseMenu.current_scene = self
	if GameData.party != $Party:
		$Party.queue_free()
		add_child(GameData.party)
	$Fade.visible = true
	print(GameData.title, GameData.playerCharacter)
	$Party/Party1.stats[0] += 5
	print($Party/Party1.stats)
	print($"Party/Party2".stats)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_K):
		GameData.health -= 5

	if Input.is_action_just_pressed("switch"):
		# get_tree().change_scene_to_file("res://Dungeon.tscn")
		var temp = party[0].get_child(0)
		party[0].remove_child(temp)
		var camera = party[0].get_child(0)
		party[0].remove_child(camera)
		var colShape = party[0].get_child(0)
		party[0].remove_child(colShape)
		print(party[0].get_children())
		for i in range(3):
			var newChild = party[i + 1].get_child(0)
			party[i + 1].remove_child(newChild)
			party[i].add_child(newChild)
		party[3].add_child(temp)
		party[0].add_child(camera)
		party[0].add_child(colShape)
	if Input.is_key_pressed(KEY_M):
		# GameData.party = $Party
		emptyPositionData()
		remove_child($Party) # remove party so it doesn't get queue_free()'d
		get_tree().change_scene_to_packed(nextLevel)

func _physics_process(delta):
	pass
	'''
	if !fadeout and $Fade.color.a > 0:
		$Fade.color.a -= delta * 1.8
	
	if fadeout and $Fade.color.a < 1:
		$Fade.color.a += delta * 1.8
	else:
		fadeout = false
	
	if Input.is_key_pressed(KEY_P):
		fadeout = true
	'''

func emptyPositionData():
	var leader = $Party/Party1
	leader.position_history.clear()

extends Node2D

signal battle_over

@onready var battleCamera = $"Camera2D"
var battle_info
var party = GameData.party
var enemies = []
var randy: RandomNumberGenerator = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	var li = [6, 4, 9, 2, 3, 1, 4, 5, 9, 10, 44, 32, 10, 35, 13]
	print(speedSort(li))
	# battle_info = GameData.BattleInfo
	# set background to whatever locationInfo/subLocationInfo tells you is the location of the battle
	# now, for setting the enemies, get a random number from 1 to 5
	# var number_of_enemies = randy.randi_range(1, 5)
	# var i = 0
	# while len(enemies) < number_of_enemies:
	#	var enemyInfo = enemyPool[i % len(enemyPool)]	([enemy_name, enemy_prcnt])
	#	if randy.randi_range(0, 99) < enemyInfo[1]:
	#		var enemy = load("res://EnemyLibrary/%s.tscn" % enemyInfo[0]).instantiate()
	#		enemies.append(enemy)
	#		get_node("Enemies").add_child(enemy)
	#		place_position(enemy, number_of_enemies)
	# 	i += 1
	# for i in range(len(get_node("Party").get_child_count())):
	#	get_node("Party").get_child(i).add_child(GameData.party[i])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# print(get_viewport_rect().size)
	if Input.is_key_pressed(KEY_V):
		for i in range(len($Party.get_children())):
			var temp = $Party.get_child(i).get_child(0)
			$Party.get_child(i).remove_child(temp)
			party_get(i).add_child(temp)

		var returnToWorld = load("res://GrassField.tscn")
		get_tree().change_scene_to_packed(returnToWorld)
		#get_tree().root.get_child(get_tree().root.get_child_count() - 1).get_node("Party").queue_free()
		#get_tree().root.get_child(get_tree().root.get_child_count() - 1).add_child(party)

# func place_position(enemy, numEnemies):
#	figure out some way to organize sprite locations based on number spawned in


# func battleOver():
# get_tree().change_scene_to_file(res://battle_info.locationName.tscn)
# use location data to set player locations right
# for pm in get_node("Party").get_children():
#	pm.remove_child(pm.get_child(0))			must remove children so they don't get queue_free()'d
# battle_info.queue_free()


func party_get(index: int):
	if index < 0 or index > 3:
		return -1
	return party.get_child(index)


func speedSort(turnOrder):
	# turnOrder has elements which are slots containing characters. you can think of this as a list
	# with "pointers" to character data. to reference the data, call turnOrder[i].get_child(0).getSpd(),
	# or turnOrder[i].get_child(0).speedCounter
	if len(turnOrder) <= 1:
		return turnOrder
	var low = turnOrder.slice(0, len(turnOrder) / 2)
	var high = turnOrder.slice((len(turnOrder) / 2), len(turnOrder))
	low = speedSort(low)
	high = speedSort(high)
	
	var i = 0
	var j = 0
	var newArr = []
	
	# replace low[i] and high[j] with low[i].get_child(0).speedCounter and high[j].get_child(0).speedCounter
	# when doing </> comparison
	while i < len(low) and j < len(high):
		if low[i] > high[j]:
			newArr.append(low[i])
			i += 1
		else:
			newArr.append(high[j])
			j += 1
	while i < len(low):
		newArr.append(low[i])
		i += 1
	while j < len(high):
		newArr.append(high[j])
		j += 1

	return newArr

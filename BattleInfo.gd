extends Object

class_name BattleInfo

# this class will be a single object used in GameData to look at the upcoming battle,
# to hold info between a battle being initiated in Exploration and a battle commencing in the Battle scene

var locationName # what field or dungeon this battle is in
var subLocationName # optional if area has special sub areas
var enemyPool = [] # list containing enemy names in the area and their % of appearing
var party = [] # list containing party members' scenes
var position_history = [] # to save position_history from Party1
var placeLeftOff = [] # describes the locations of the party members from before the battle
						# (both the "Party" node's and the nodes of each Party Members' locations)

func _init(ln, ep, prty, pos_hist, placeLeft, sln=null):
	locationName = ln
	subLocationName = sln
	enemyPool = ep
	party = prty
	position_history = pos_hist
	placeLeftOff = placeLeft

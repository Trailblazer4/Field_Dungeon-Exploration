@icon("res://images/Chio Icon.png")
extends CharacterBody2D

class_name Entity
var stats
var SPEED = 100.0

func _init():
	stats = [180, 24, 20]


func setHP(shp):
	stats[0] = shp

func getHP():
	return stats[0]

func setSP(ssp):
	stats[1] = ssp

func getSP():
	return stats[1]

func setAtk(satk):
	stats[2] = satk

func getAtk():
	return stats[2]

func setDef(sdef):
	stats[3] = sdef

func getDef():
	return stats[3]

func setMgDf(smgdf):
	stats[4] = smgdf

func getMgDf():
	return stats[4]

func setSpd(sspd):
	stats[5] = sspd

func getSpd():
	return stats[5]

func use(skill, target: Entity): # skill is of type Spell
	# use skill from child (character in this slot) on target's child (target character in opponent's slot)
	pass

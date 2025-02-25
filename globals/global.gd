extends Node

signal stats_change

var laser_amount = 20:
	set(value):
		laser_amount = value
		stats_change.emit()
var grenade_amount = 10:
	set(value):
		grenade_amount = value
		stats_change.emit()
var health = 60:
	set(value):
		health = value
		stats_change.emit()
		
var player_pos: Vector2

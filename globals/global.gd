extends Node

var player_vulnerable:bool = true

signal stats_change

var player_hit_sound:AudioStreamPlayer2D

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
		if value > health:
			health = min(value,100)
		else:
			if player_vulnerable:
				health = value
				player_vulnerable = false
				player_invunerable_timer()
				player_hit_sound.play()
		stats_change.emit()

func player_invunerable_timer():
	await get_tree().create_timer(0.5).timeout
	player_vulnerable = true

var player_pos: Vector2

func _ready() -> void:
	player_hit_sound = AudioStreamPlayer2D.new()
	player_hit_sound.stream = load("res://audio/solid_impact.ogg")
	add_child(player_hit_sound)

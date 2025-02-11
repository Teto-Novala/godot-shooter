extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
@onready var player: CharacterBody2D = $Player
@onready var projectiles: Node2D = $Projectiles

var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(body) -> void:
	print("Player has entered gate")
	print(body)


func _on_player_laser_signal_custom(pos) -> void:
	var laser = laser_scene.instantiate()
	laser.position = pos
	projectiles.add_child(laser)


func _on_player_grenade_signal_custom(pos) -> void:
	var grenade = grenade_scene.instantiate()
	grenade.position = pos
	projectiles.add_child(grenade)

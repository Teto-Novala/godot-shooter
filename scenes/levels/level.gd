extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
@onready var player: CharacterBody2D = $Player
@onready var projectiles: Node2D = $Projectiles

var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

@onready var camera_2d: Camera2D = $Player/Camera2D

func _on_player_laser_signal_custom(pos,direction) -> void:
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle())+90
	laser.direction = direction
	projectiles.add_child(laser)


func _on_player_grenade_signal_custom(pos,direction) -> void:
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	projectiles.add_child(grenade)



func _on_house_player_entered() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(camera_2d,"zoom",Vector2(1,1),1).set_trans(Tween.TRANS_QUAD)


func _on_house_player_exited() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(camera_2d,"zoom",Vector2(0.6,0.6),2)
	

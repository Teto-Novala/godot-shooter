extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
@onready var player: CharacterBody2D = $Player
@onready var projectiles: Node2D = $Projectiles

var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/items/item.tscn")

@onready var camera_2d: Camera2D = $Player/Camera2D

@onready var ui: CanvasLayer = $UI

func _ready() -> void:
	for container in get_tree().get_nodes_in_group('Container'):
		container.connect("open",_on_container_opened)

func _on_container_opened(pos,direction):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = direction
	$Items.call_deferred('add_child',item)
	
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
	

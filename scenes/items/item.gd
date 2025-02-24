extends Area2D

var rotation_speed: int = 5

var available_options = ['laser','grenade','health']
var type = available_options[randi()%len(available_options)]

@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	if type == 'laser':
		sprite_2d.modulate = Color(0.1,0.2,0.8)
	
	if type == 'grenade':
		sprite_2d.modulate = Color(0.8,0.2,0.1)
		
	if type == 'health':
		sprite_2d.modulate = Color(0.1,0.8,0.1)
		

func _process(delta: float) -> void:
	rotation += rotation_speed * delta


func _on_body_entered(_body: Node2D) -> void:
	if type == 'health':
		Global.health += 10
	if type == 'laser':
		Global.laser_amount += 10
	if type == 'grenade':
		Global.grenade_amount += 5
	queue_free()

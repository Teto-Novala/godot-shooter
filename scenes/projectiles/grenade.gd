extends RigidBody2D

const speed = 750

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var explosion_active:bool = false
var explosion_range:int = 400

func explode():
	animation_player.play("Explosion")
	explosion_active = true

func _process(_delta: float) -> void:
	if explosion_active:
		var targets = get_tree().get_nodes_in_group("Container") + get_tree().get_nodes_in_group("Entity")
		for target in targets:
			var in_range = target.global_position.distance_to(global_position) < explosion_range
			if "hit" in target and in_range:
				target.hit()
	

extends RigidBody2D

const speed = 750

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func explode():
	animation_player.play("Explosion")
	

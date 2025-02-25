extends CharacterBody2D

var player_nearby: bool = false
var can_laser:bool = true

var right_gun_use:bool = true

signal laser(pos,direction)

func _process(_delta: float) -> void:
	if player_nearby:
		look_at(Global.player_pos)
		if can_laser:
			var marker = $LaserSpawnPositions.get_child(right_gun_use)
			right_gun_use = not right_gun_use
			var pos: Vector2 = marker.global_position
			var direction: Vector2 = (Global.player_pos - position).normalized()
			laser.emit(pos,direction)
			can_laser = false
			$LaserCooldown.start()


func _on_attack_area_body_entered(_body: Node2D) -> void:
	player_nearby = true


func _on_attack_area_body_exited(_body: Node2D) -> void:
	player_nearby = false


func _on_laser_cooldown_timeout() -> void:
	can_laser = true

func hit():
	print("scout was hit")

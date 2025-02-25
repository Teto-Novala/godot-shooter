extends CharacterBody2D

var health:int = 60

var player_nearby: bool = false
var can_laser:bool = true

var right_gun_use:bool = true

var vulnerable: bool = true

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
			$Timers/LaserCooldown.start()


func _on_attack_area_body_entered(_body: Node2D) -> void:
	player_nearby = true


func _on_attack_area_body_exited(_body: Node2D) -> void:
	player_nearby = false



func hit():
	if vulnerable:
		health -= 10
		vulnerable = false
		$Timers/HitTimer.start()
	if health <= 0:
		queue_free()


func _on_laser_cooldown_timeout() -> void:
	can_laser = true


func _on_hit_timer_timeout() -> void:
	vulnerable = true

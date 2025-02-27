extends CharacterBody2D

var speed:int = 30000
var speed_up:int = 0
var speed_multiplier:int = 1
var vulnerable:bool = true
var health: int = 80

var active:bool = false
var explosion_active:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Explosion.hide()
	$Sprite2D.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active:
		look_at(Global.player_pos)
		var direction = (Global.player_pos - position).normalized()
		velocity = direction * speed * speed_multiplier * delta
		var collision = move_and_collide(velocity * delta)
		if collision:
			$AnimationPlayer.play("explosion")
			explosion_active = true
	
	if explosion_active:
		var targets = get_tree().get_nodes_in_group("Container") + get_tree().get_nodes_in_group("Entity")
		for target in targets:
			var in_range = target.global_position.distance_to(global_position) < 400
			if in_range and  "hit" in target:
				target.hit()
			

func hit():
	if vulnerable:
		health -= 10
		vulnerable = false
		$HitTimer.start()
		$Sprite2D.material.set_shader_parameter("progress",0.5)
	if health <= 0:
		$AnimationPlayer.play("explosion")
		explosion_active = true

func stop_move():
	speed_multiplier = 0

func _on_notice_area_body_entered(body: Node2D) -> void:
	active = true
	var tween = create_tween()
	tween.tween_property(self,"speed_up",speed,10)


func _on_hit_timer_timeout() -> void:
	vulnerable = true
	$Sprite2D.material.set_shader_parameter("progress",0)

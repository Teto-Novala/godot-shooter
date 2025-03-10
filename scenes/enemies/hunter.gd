extends CharacterBody2D

var active:bool = false
var player_near:bool = false
var speed: int = 200
var vulnerable:bool = true
var health:int = 100
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

func _ready() -> void:
	navigation_agent_2d.path_desired_distance = 4.0
	navigation_agent_2d.target_desired_distance = 4.0
	navigation_agent_2d.target_position = Global.player_pos

func _physics_process(_delta: float) -> void:
	if active:
		var next_path_pos: Vector2 = navigation_agent_2d.get_next_path_position()
		var direction: Vector2 = (next_path_pos - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
		#look_at(Global.player_pos)
		var look_angle = direction.angle()
		rotation = look_angle + PI / 2

func _on_notice_area_body_entered(_body: Node2D) -> void:
	active = true
	$AnimationPlayer.play("walk")

func _on_notice_area_body_exited(_body: Node2D) -> void:
	active = false
	$AnimationPlayer.stop()

func _on_timer_timeout() -> void:
	if active:
		navigation_agent_2d.target_position = Global.player_pos

func _on_attack_area_body_entered(_body: Node2D) -> void:
	player_near = true
	$AnimationPlayer.play("attack")

func _on_attack_area_body_exited(_body: Node2D) -> void:
	player_near = false
	$AnimationPlayer.play("walk")

func attack():
	if player_near:
		Global.health -= 20

func hit():
	if vulnerable:
		health-=10
		vulnerable = false
		$Timers/HitTimer.start()
	if health <= 0:
		queue_free()

func _on_hit_timer_timeout() -> void:
	vulnerable = true

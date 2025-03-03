extends CharacterBody2D

var active:bool = false
var speed: int = 200
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

func _ready() -> void:
	navigation_agent_2d.target_position = Global.player_pos
func _physics_process(_delta: float) -> void:
	if active:
		var next_path_pos: Vector2 = navigation_agent_2d.get_next_path_position()
		var direction: Vector2 = (next_path_pos - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
		look_at(Global.player_pos)

	
	

func _on_notice_area_body_entered(_body: Node2D) -> void:
	active = true


func _on_notice_area_body_exited(_body: Node2D) -> void:
	active = false


func _on_timer_timeout() -> void:
	if active:
		navigation_agent_2d.target_position = Global.player_pos

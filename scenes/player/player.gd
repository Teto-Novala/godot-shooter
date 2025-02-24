extends CharacterBody2D

var can_laser := true
var can_grenade := true

signal laser_signal_custom(pos,direction)
signal grenade_signal_custom(pos,direction)
signal update_ui_stats

@onready var laser_timer: Timer = $LaserTimer
@onready var grenade_timer: Timer = $GrenadeTimer

@onready var laser_start_positions: Node2D = $LaserStartPositions
@onready var grenade_start_position: Node2D = $GrenadeStartPosition

@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D

@export var max_speed:int = 800
var speed: int = max_speed


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	# input
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	# rotate player
	look_at(get_global_mouse_position())
	
	# shooting mechanic
	var player_direction = (get_global_mouse_position() - position).normalized()
	if Input.is_action_just_pressed("primary action") and can_laser and Global.laser_amount > 0:
		# randomly selected marker 2D for the laser
		Global.laser_amount -= 1
		gpu_particles_2d.emitting = true
		var laser_markers = laser_start_positions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		laser_timer.start()
		laser_signal_custom.emit(selected_laser.global_position,player_direction)
	# grenade mechanic
	if Input.is_action_just_pressed("secondary action") and can_grenade and Global.grenade_amount > 0:
		Global.grenade_amount -= 1
		var grenade_markers = grenade_start_position.get_children()
		var selected_grenade = grenade_markers[randi() % grenade_markers.size()]
		can_grenade = false
		grenade_timer.start()
		
		grenade_signal_custom.emit(selected_grenade.global_position,player_direction)


func _on_laser_timer_timeout() -> void:
	can_laser = true


func _on_grenade_timer_timeout() -> void:
	can_grenade = true
	
func add_item(type:String)->void:
	if type == 'laser':
		Global.laser_amount += 10
	
	if type == 'grenade':
		Global.grenade_amount += 5
	update_ui_stats.emit()
	

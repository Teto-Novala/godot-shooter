extends CharacterBody2D

var can_laser := true
var can_grenade := true

signal laser_signal_custom
signal grenade_signal_custom

@onready var laser_timer: Timer = $LaserTimer
@onready var grenade_timer: Timer = $GrenadeTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	# input
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500
	move_and_slide()
	
	# shooting mechanic
	if Input.is_action_just_pressed("primary action") and can_laser:
		print("Shoot")
		laser_signal_custom.emit()
		can_laser = false
		laser_timer.start()
	# grenade mechanic
	if Input.is_action_just_pressed("secondary action") and can_grenade:
		print("Grenaaddeee")
		grenade_signal_custom.emit()
		can_grenade = false
		grenade_timer.start()


func _on_laser_timer_timeout() -> void:
	can_laser = true


func _on_grenade_timer_timeout() -> void:
	can_grenade = true

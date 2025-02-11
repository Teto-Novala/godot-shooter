extends CharacterBody2D


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
	if Input.is_action_just_pressed("primary action"):
		print("Shoot")
		
	# grenade mechanic
	if Input.is_action_just_pressed("secondary action"):
		print("Grenaaddeee")

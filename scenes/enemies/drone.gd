extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# direction
	var direction = Vector2.RIGHT
	
	# velocity
	velocity = direction * 100
	
	# move and slide
	move_and_slide()
		

func hit():
	print("AAAHHHH")

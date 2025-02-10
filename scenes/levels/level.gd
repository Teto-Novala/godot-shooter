extends Node2D

var test_array: Array[String] = ["Test","Hello","Stuff"]

func _ready() -> void:
	$Logo.rotation_degrees = 90
	
	for i in test_array:
		print(i)
	
	print(test_array[2])
	
func _process(delta: float) -> void:
	$Logo.rotation_degrees += 50 * delta
	
	# flow -> if rotation > 180 -> 0
	if $Logo.rotation_degrees > 180:
		$Logo.rotation_degrees = 0
	
	if $Logo.position.x > 1000:
		print("masok")
		$Logo.pos.x = 0

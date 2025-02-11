extends Node2D

var test_array: Array[String] = ["Test","Hello","Stuff"]

func _ready() -> void:
	$Logo.rotation_degrees = 90
	
	for i in test_array:
		print(i)
	
	print(test_array[2])
	
func _process(delta: float) -> void:
	pass
		

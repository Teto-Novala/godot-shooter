extends CanvasLayer

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label

@onready var grenade_label: Label = $GrenadeCounter/VBoxContainer/Label

func _ready() -> void:
	update_laser_text()
	update_grenade_text()

func update_laser_text():
	laser_label.text = str(Global.laser_amount)
	
func update_grenade_text():
	grenade_label.text = str(Global.grenade_amount)

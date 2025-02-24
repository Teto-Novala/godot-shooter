extends CanvasLayer

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label
@onready var grenade_label: Label = $GrenadeCounter/VBoxContainer/Label
@onready var laser_icon: TextureRect = $LaserCounter/VBoxContainer/TextureRect
@onready var grenade_icon: TextureRect = $GrenadeCounter/VBoxContainer/TextureRect
@onready var health_bar: TextureProgressBar = $MarginContainer/TextureProgressBar


var green:Color = Color('6bbf3a')
var red:Color = Color(0.9,0,0,1)

func _ready() -> void:
	Global.connect('stats_change',update_all_text)
	update_all_text()

func update_laser_text():
	laser_label.text = str(Global.laser_amount)
	update_color(Global.laser_amount,laser_label,laser_icon)
	
func update_grenade_text():
	grenade_label.text = str(Global.grenade_amount)
	update_color(Global.grenade_amount,grenade_label,grenade_icon)
	
func update_health_text():
	health_bar.value = Global.health
	
func update_all_text():
	update_laser_text()
	update_grenade_text()
	update_health_text()
	
	
func update_color(amount:int,label:Label,icon:TextureRect)->void:
	if amount <= 0:
		label.modulate = red
		icon.modulate = red
	else:
		label.modulate = green
		icon.modulate = green
	

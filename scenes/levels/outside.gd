extends LevelParent

func _on_gate_player_entered_gate(_body: Variant) -> void:
	var tween = create_tween()
	tween.tween_property(player,"speed",0,0.5)
	TransitionLayer.change_scene("res://scenes/levels/inside.tscn")



func _on_house_player_entered() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(camera_2d,"zoom",Vector2(1,1),1).set_trans(Tween.TRANS_QUAD)


func _on_house_player_exited() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(camera_2d,"zoom",Vector2(0.6,0.6),2)

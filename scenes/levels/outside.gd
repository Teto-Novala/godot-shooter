extends LevelParent

var inside_level_scene: PackedScene = preload("res://scenes/levels/inside.tscn")

func _on_gate_player_entered_gate(_body: Variant) -> void:
	var tween = create_tween()
	tween.tween_property(player,"speed",0,0.5)
	get_tree().change_scene_to_packed(inside_level_scene)

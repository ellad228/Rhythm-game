extends Label

func _enter_tree():
	add_to_group("Score_Counter")

func _on_level_map_get_score(value):
	text = str(value)

extends Control


func _on_level_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/levels/level_1.tscn")

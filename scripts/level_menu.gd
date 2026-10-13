extends Control

var parent_node: MainMenu


func _ready() -> void:
	assert(get_parent() is MainMenu,
			"出现这个错误,大概率是你修改了主菜单根节点的ClassName")
	parent_node = get_parent()


func _on_exit_button_pressed() -> void:
	parent_node.from_level_menu_exit()

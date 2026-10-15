extends Control

var parent_node: MainMenu


func _ready() -> void:
	assert(get_parent() is MainMenu,
			"在创建选关节点时出错,这个节点必须建立在主菜单MainMenu下")
	parent_node = get_parent()


func _on_exit_button_pressed() -> void:
	parent_node.from_level_menu_exit()

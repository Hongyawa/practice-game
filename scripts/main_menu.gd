class_name MainMenu
extends Control

# 跟背景图片有关的变量
var is_right_value: int = -1
var background_position: Vector2
@onready var background: Sprite2D = $ColorRect/Background

# 跟中心菜单有关的变量
const SELECT_LEVEL_MENU = preload("uid://bbujs6ukk61tk")
@onready var cenater_ui: MarginContainer = $CenaterUI
@onready var level_menu: Control = $LevelMenu
@onready var help_menu: Panel = $HelpMenu


func _ready() -> void:
	background_position = background.position


## 让背景图片滚动
func _process(delta: float) -> void:
	background_position.x += 50 * is_right_value * delta
	background_position.y += 50 * is_right_value * delta
	background.position = background_position


## 背景图片滚动一定时间之后,让他换个方向滚动
func _on_reverse_timer_timeout() -> void:
	is_right_value *= -1


## 按下开始按钮之后的操作,隐藏主界面,显示关卡界面
func _on_start_button_pressed() -> void:
	cenater_ui.visible = false
	level_menu.visible = true


## 在选关界面按下返回后的操作,隐藏选关界面,显示主界面
func from_level_menu_exit():
	cenater_ui.visible = true
	level_menu.visible = false


## 按下帮助按钮之后,显示提示界面
func _on_help_button_pressed() -> void:
	cenater_ui.visible = false
	help_menu.visible = true


## 按下帮助界面里面的确定按钮之后
func _on_confirm_button_pressed() -> void:
	help_menu.visible = false
	cenater_ui.visible = true


## 按下设置按钮之后的操作,隐藏主界面,显示设置界面(未制作)
func _on_setttings_button_pressed() -> void:
	pass


## 按下离开按钮之后的操作,关闭游戏
func _on_quit_button_pressed() -> void:
	get_tree().quit()

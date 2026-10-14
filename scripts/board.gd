extends Area2D

@export var text := "Hello, World!!!"
## 勾选这个选项可以让场景被加载时就显示文字,适合用来测试文字效果
@export var text_test := false
@onready var label: Label = $Label


func _ready() -> void:
	label.text = text
	label.visible = text_test


## 玩家进入时显示文字
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		label.visible = true


## 玩家退出时隐藏文字
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		label.visible = false

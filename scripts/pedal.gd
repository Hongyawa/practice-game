## 请阅读Door节点的文档
class_name Pedal
extends StaticBody2D

## 必须绑定一个Door,否则会报错,当玩家走到该节点时,Door会被打开
@export var door: Door

var is_pressed := false

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var top_body: StaticBody2D = $TopBody


func _ready() -> void:
	if door:
		push_warning("必须在检查器中绑定一个Door")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") or body.is_in_group("box"):
		# 按钮按下的动画
		if  is_pressed:
			return
		else:
			if animation_player.is_playing():
				var current_time = animation_player.current_animation_position
				animation_player.play_section("press", current_time)
			else:
				animation_player.play("press")
		is_pressed = true

		# 开门
		door.open()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player") or body.is_in_group("box"):
		# 按钮弹起动动画,本质是跟按下动画共用一个动画
		if not is_pressed:
			return
		else:
			if animation_player.is_playing():
				var current_time = animation_player.current_animation_position
				animation_player.play_section_backwards(
						"press", -1, current_time)
			else:
				animation_player.play_backwards("press")
		is_pressed = false

		# 关门
		door.close()

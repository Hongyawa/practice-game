## 这个节点类似与一扇门,当一个Pedal按钮被按下时,这个节点会被激活,这个门就会被"推动"
class_name Door
extends AnimatableBody2D

## 必须绑定一个Pedal,否则会报错
## 当玩家走到Pedal节点时,该节点会被激活,门会打开
@export var pedal: Pedal
## 决定激活时向左还是向右移动,默认开启,即向右移动
@export var move_to_right := true

var animation_name: String
var is_open := false

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	if pedal:
		push_warning("必须在检查器中绑定一个Penal")
	animation_name = "right" if move_to_right else "left"
	animation_name = "move_" + animation_name


func open():
	if is_open:
		return
	else:
		if animation_player.is_playing():
			var current_time = animation_player.current_animation_position
			animation_player.play_section(animation_name, current_time)
		else:
			animation_player.play(animation_name)
		is_open = true


func close():
	if not is_open:
		return
	else:
		if animation_player.is_playing():
			var current_time = animation_player.current_animation_position
			animation_player.play_section_backwards(
					animation_name, -1, current_time)
		else:
			animation_player.play_backwards(animation_name)
		is_open = false

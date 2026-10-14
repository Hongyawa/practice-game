class_name Player
extends CharacterBody2D

@export var speed := 350.0
@export var jump_velocity := -550.0
@export var push_factor := 0.5


func _physics_process(delta):
	# 处理玩家移动
	velocity.x = Input.get_axis("ui_left", "ui_right") * speed
	velocity.y += ProjectSettings.get_setting(
			"physics/2d/default_gravity") * 1.2 * delta
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_velocity
	var is_collising: bool = move_and_slide()

	# 处理碰撞逻辑
	if is_collising:
		for i in get_slide_collision_count():
			var collision: KinematicCollision2D = get_slide_collision(i)
			var collider: Object = collision.get_collider()
			# 此处为箱子的碰撞逻辑
			if collider is Node:
				if collider.is_in_group("box"):
					collider = collider as RigidBody2D
					var normal = collision.get_normal() * -1
					collider.set_axis_velocity(
							velocity.project(normal) * push_factor
					)

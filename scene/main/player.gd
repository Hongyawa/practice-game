extends CharacterBody2D

@export var speed := 350.0
@export var jump_velocity := -550.0
@export var push_force := 500.0


func _physics_process(delta):
	# 处理玩家移动
	velocity.x = Input.get_axis("ui_left", "ui_right") * speed
	velocity.y += ProjectSettings.get_setting(
			"physics/2d/default_gravity") * 1.2 * delta
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_velocity
	move_and_slide()

	# 处理箱子的碰撞
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider is RigidBody2D:
			var push_direction = -collision.get_normal()
			collider.apply_force(push_direction * push_force)

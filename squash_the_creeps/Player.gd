extends KinematicBody

signal hit

export var speed = 10
export var fall_accelration = 14
export var jump_impulse = 10
export var bounce_impulce = 8

var velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(translation + direction, Vector3.UP)
		$AnimationPlayer.playback_speed = 4
	else:
		$AnimationPlayer.playback_speed = 1

	if is_on_floor():
		$AnimationPlayer.play()
	else:
		$AnimationPlayer.stop()

	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	if is_on_floor() and Input.is_action_pressed("jump"):
		velocity.y += jump_impulse
	
	velocity.y -= fall_accelration * delta 
	velocity = move_and_slide(velocity, Vector3.UP)

	$Pivot.rotation.x = PI / 6 * velocity.y / jump_impulse

	for index in range(get_slide_count()):
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("mob"):
			var mob = collision.collider
			if Vector3.UP.dot(collision.normal) > 0.1:
				mob.squash()
				velocity.y = bounce_impulce

func die():
	emit_signal("hit")
	queue_free()
	

func _on_MobDetector_body_entered(_body):
	die()

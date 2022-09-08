extends KinematicBody2D

onready var image = get_node("Player")

var SPEED = 300
var JUMP_FORCE = 400
var GRAVITY = 600

var _vel = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("player_left"):
		_vel.x -= SPEED * delta
	elif Input.is_action_pressed("player_right"):
		_vel.x += SPEED * delta
	
	_vel.y += GRAVITY * delta

	if Input.is_action_pressed("player_jump") and is_on_floor():
		_vel.y -= JUMP_FORCE
	
	_vel = move_and_slide(_vel, Vector2.UP)
	
	image.flip_h = false
	if _vel.x < 0:
		image.flip_h = true 

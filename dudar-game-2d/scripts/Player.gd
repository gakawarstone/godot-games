extends KinematicBody2D

onready var image = get_node("Player")

var SPEED = 300
var JUMP_FORCE = 500
var GRAVITY = 1000
var F_TR = 10


var _vel = Vector2()

func _ready():
	print('ddd')
	GameManager.Player = self

func do():
	print('do')

func _physics_process(delta):
	if Input.is_action_pressed("player_left"):
		_vel.x = -SPEED 
		image.flip_h = true 
	elif Input.is_action_pressed("player_right"):
		_vel.x = SPEED
		image.flip_h = false
	
	if is_on_floor():
		if _vel.abs().x == F_TR:
			_vel.x = 0
		elif _vel.x > 0:
			_vel.x -= F_TR
		elif _vel.x < 0:
			_vel.x += F_TR

	
	_vel.y += GRAVITY * delta

	if Input.is_action_pressed("player_jump") and is_on_floor():
		_vel.y -= JUMP_FORCE
	
	_vel = move_and_slide(_vel, Vector2.UP)
	

extends KinematicBody2D

signal selected

var block_under
var block_goto
var speed = 5

func _ready():
	pass

func _process(delta):
	if block_goto != block_under:
		var direction = move_and_slide((block_goto.global_position - position), Vector2.UP).normalized()
		position += direction * speed
	else:
		block_under.selected = false

		


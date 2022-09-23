extends KinematicBody2D


var selected = false
var block_under
var block_goto
var speed = 5
var stage = "None"


func _ready():
	pass

func move_to(block):
	pass

func _process(delta):
	if stage == "None" && block_under.selected:
		block_under.selected = false
		selected = true
		stage = 'Selected'


func _physics_process(delta):
	if stage == 'Move':
		if (block_goto.get_node("Pivot").get_global_rect().get_center() - position).length() < 5 && block_goto.selected:
			block_under.selected = false
			selected = false
			stage = "None"
			print('stopped')
		else:
			var pos = block_goto.get_node("Pivot").get_global_rect().get_center() - position
			print(pos.length())
			var direction = move_and_slide(pos, Vector2.UP).normalized()
			position += direction * speed

		
	


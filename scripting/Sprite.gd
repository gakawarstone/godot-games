extends Sprite

var speed = 200
var angular_speed = PI/2

func _ready():
	var timer = get_node('Timer')
	print(timer)
	timer.connect("timeout", self, "_on_Timer_timeout")
	print('dd') 

func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta

func _on_Button_pressed():
	set_process(not is_processing())

func _on_Timer_timeout():
	visible = not visible

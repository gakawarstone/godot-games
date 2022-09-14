extends Sprite

var speed = 200
var angular_speed = PI/2

func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta

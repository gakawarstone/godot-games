extends Node2D

var selected = false
var hovered = false

func contains_position(pos):
	return $Pivot.get_rect().has_point(pos - global_position)


func is_hovered():
	return contains_position(get_global_mouse_position())

func toogle_select():
	yield(get_tree().create_timer(1), "timeout")
	return not selected


func _process(delta):
	if is_hovered() and Input.is_action_pressed("ui_select"):
		selected = toogle_select()	
	
	$BlockHover.visible = selected or is_hovered()
	

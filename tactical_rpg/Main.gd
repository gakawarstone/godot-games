extends Node2D


func _ready():
	var blocks = get_tree().get_nodes_in_group("blocks")
	for block in blocks:
		if block.contains_position($Player.position):
			print('dd')
			block.selected = true
	
func _process(delta):
	pass

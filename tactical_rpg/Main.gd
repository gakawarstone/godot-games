extends Node2D


func _ready():
	var blocks = get_tree().get_nodes_in_group("blocks")
	for block in blocks:
		if block.contains_position($Player.position):
			$Player.block_under = block
			$Player.block_goto = block
	
func _process(delta):
	var blocks = get_tree().get_nodes_in_group("blocks")
	for block in blocks:
		if block.contains_position($Player.position):
			$Player.block_under = block
		if block.selected:
			$Player.block_goto = block
	


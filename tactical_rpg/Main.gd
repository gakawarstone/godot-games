extends Node2D


func _ready():
	var blocks = get_tree().get_nodes_in_group("blocks")
	var players = get_tree().get_nodes_in_group("players")
	print(players)
	for block in blocks:
		for player in players:
			if block.contains_position($Player.position):
				player.block_under = block
				player.block_goto = block
	
func _process(delta):
	var blocks = get_tree().get_nodes_in_group("blocks")
	var players = get_tree().get_nodes_in_group("players")
	for block in blocks:
		for player in players:
			if block.contains_position(player.position):
				player.block_under = block
			
			if player.stage == "Selected":
				if (block.global_position - player.position).length() < player.available_distance:
					block.available = true

				if block.selected && block.available && player.selected && block != player.block_under:
					player.block_under.selected = false
					player.block_goto = block
					player.stage = "Move"
			
			if player.stage == "Move":
				block.available = false
				block.selected = false

			
	$Debug/Label.text = $Player.stage
	$Debug/Label2.text = $Player2.stage
	


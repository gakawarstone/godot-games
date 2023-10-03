extends Area2D


func _on_Coin_body_entered(body:Node):
	if body.name == "Player":
		get_tree().queue_delete(self)
		GameManager.Score.increment()



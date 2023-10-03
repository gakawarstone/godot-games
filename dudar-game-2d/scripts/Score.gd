extends PanelContainer

onready var _SCORE = 0

func _ready():
	print('score ready')
	GameManager.Score = self

func _process(delta):
	get_node("d").text = str(_SCORE)

func increment():
	_SCORE += 1
	print('Score = ', _SCORE)

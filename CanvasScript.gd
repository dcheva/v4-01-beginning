extends CanvasLayer

var score = 66

func _ready():
	$TextureRect/ScoreValue.text = String(score)

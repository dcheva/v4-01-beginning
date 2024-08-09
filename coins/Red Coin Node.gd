extends Area2D

signal open_the_door

func _ready():
	$AnimationPlayer.play("Coin-rotate")

func _on_Coin_Node_body_entered(body):
	body.score_count('red')
	body.level_finished = true
	emit_signal("open_the_door")
	queue_free()

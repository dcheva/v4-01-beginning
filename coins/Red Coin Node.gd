extends Area2D

func _ready():
	$AnimationPlayer.play("Coin-rotate")

func _on_Coin_Node_body_entered(body):
	body.score_count('red')
	body.level_finished = true
	print("Open the Door please!")
	queue_free()

extends Area2D

func _ready():
	$AnimationPlayer.play("Coin-rotate")

func _on_Coin_Node_body_entered(body):
	#if body.
	body.score_count()
	queue_free()

extends Node2D

func _ready():
	$"Level Area".hide()
	$"Player Node/Open the Door".hide()
	$"Player Node/Game Over".hide()

func _on_Red_Coin_Node8_open_the_door():
	$"Level Area".show()
	$"Player Node/Open the Door".show()
	$"Player Node/Open the Door/AnimationPlayer".play("Go")

func _on_CanvasLayer_game_over():
	$"Player Node".died = true
	$"Player Node/Game Over/Restart".start()
	$"Player Node/Game Over".show()
	$"Player Node/Game Over/AnimationPlayer".play("Go")
	
func _on_Restart_timeout():
	get_tree().change_scene("res://Scene.tscn")

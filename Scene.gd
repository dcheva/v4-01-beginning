extends Node2D


func _ready():
	$"Level Area".hide()
	$"Player Node/Open the Door".hide()


func _on_Red_Coin_Node8_open_the_door():
	$"Level Area".show()
	$"Player Node/Open the Door".show()
	$"Player Node/Open the Door/AnimationPlayer".play("Go")

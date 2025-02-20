extends Node2D

func _ready():
	$"Level Area".hide()
	$"Player Node/Open the Door".hide()
	$"Player Node/Game Over".hide()
	$Control.hide()

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

func _on_Play_pressed():
	get_tree().change_scene("res://Scene.tscn")

func _on_Settings_pressed():
	OS.window_fullscreen = !OS.window_fullscreen

func _on_Quit_pressed():
	get_tree().quit()

func _on_Player_Node_pause():
	if $Control.visible:
		$Control.visible = false
		$Control/Camera2D.current = false
		$CanvasLayer.visible = true
		$"Player Node/Camera2D".current = true
	else:
		$Control.visible = true
		$Control/Camera2D.current = true
		$CanvasLayer.visible = false
		$"Player Node/Camera2D".current = false

extends CanvasLayer

var score = 0
var lives = 0

func _ready():
	$ScoreValue.text = String(score)
	
func _update_hud_score():
	score = get_parent().get_node("Player Node").score
	$ScoreValue.text = String(score)
	
func _update_hud_life():
	lives = get_parent().get_node("Player Node").lives
	match lives:
		3:
			pass
		2:
			$Heart3.hide()
		1:
			$Heart3.hide()
			$Heart2.hide()
		0:
			$Heart3.hide()
			$Heart2.hide()
			$Heart1.hide() 
			get_tree().change_scene("res://Scene.tscn") # Game over   
			

func _on_Player_Node_silver_coin_collected():
	_update_hud_score()

func _on_Player_Node_gold_coin_collected():
	_update_hud_score()

func _on_Player_Node_red_coin_collected():
	_update_hud_score()

func _on_Player_Node_lives_count():
	_update_hud_life()

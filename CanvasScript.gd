extends CanvasLayer

var score = 00

func _ready():
	$TextureRect/ScoreValue.text = String(score)
	
func _update_hud_score():
	score = get_parent().get_node("Player Node").score
	$TextureRect/ScoreValue.text = String(score)

func _on_Player_Node_silver_coin_collected():
	_update_hud_score()

func _on_Player_Node_gold_coin_collected():
	_update_hud_score()

func _on_Player_Node_red_coin_collected():
	_update_hud_score()

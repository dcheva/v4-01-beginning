extends KinematicBody2D

onready var _animation_player = $AnimationPlayer
onready var _sprite = $Sprite

var velocity = Vector2(0,0)

var speed = 300
var jump_speed = -1000
var gravity = 3000
var level_finished = false

var score = 0
var lives = 3

signal silver_coin_collected
signal gold_coin_collected
signal red_coin_collected
signal lives_count

func _physics_process(_delta):
	
	# bounce simulation 
	if is_on_ceiling():
		velocity.y = -velocity.y 
	#if is_on_wall():
	#	velocity.x = -velocity.x
	
	# controls
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
		_animation_player.play("Jump")
	elif Input.is_action_pressed("left_arrow"):
		_animation_player.play("Run")
		$Sprite.flip_h = true
		velocity.x = -speed
	elif Input.is_action_pressed("right_arrow"):
		_animation_player.play("Run")
		$Sprite.flip_h = false
		velocity.x = speed
	else:
		_animation_player.play("Idle")
		
	# speed gap fix
	if is_on_floor() and velocity.y > speed:
		velocity.y = speed
		
	if Input.is_action_pressed("jump") or not is_on_floor():
		_animation_player.play("Jump")
		
	# process ohysics
	velocity.y = velocity.y + gravity * (_delta)
	move_and_slide(velocity, Vector2.UP, true)
	velocity.x = lerp(velocity.x, 0, _delta*10)

# score counter
func score_count(coin = 'silver'):
	match coin:
		'silver':
			score = score +  1
			emit_signal("silver_coin_collected")
		'gold':
			score = score +  3
			emit_signal("gold_coin_collected")
		'red':
			score = score + 20
			emit_signal("red_coin_collected")
	
# lives counter
func hit():
	lives -= 1
	emit_signal("lives_count")

# level finished signal
func _on_Level_Area_body_entered(_body):
	if level_finished:
		print("Level finished with score: %s,Lives: %s" % [score, lives])
		get_tree().change_scene("res://Scene.tscn") 

extends KinematicBody2D

onready var _animation_player = $AnimationPlayer
onready var _sprite = $Sprite

var velocity = Vector2(0,0)

var speed = 300
var jump_speed = -600
var gravity = 2000

func _physics_process(_delta):
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
		
	if Input.is_action_pressed("jump") or not is_on_floor():
		_animation_player.play("Jump")
		
	velocity.y = velocity.y + gravity * (_delta)
	move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x, 0, 0.1)

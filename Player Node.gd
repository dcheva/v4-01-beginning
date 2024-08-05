extends KinematicBody2D

var velocity = Vector2(0,0)
var speed = 300
var jump_speed = -1000
var gravity = 2000

func _physics_process(_delta):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y= jump_speed
		$Sprite.play("Jump-up")
	elif Input.is_action_pressed("left_arrow"):
		$Sprite.play("Run-right")
		$Sprite.flip_h = true
		velocity.x = -speed
	elif Input.is_action_pressed("right_arrow"):
		$Sprite.play("Run-right")
		$Sprite.flip_h = false
		velocity.x = speed
	else:
		 $Sprite.play("Idle")
		
	if Input.is_action_pressed("jump") or not is_on_floor():
		$Sprite.play("Jump-up")
		
	velocity.y = velocity.y + gravity * (_delta)
	velocity.x = lerp(velocity.x, 0, _delta * 4)
	move_and_slide(velocity, Vector2.UP)

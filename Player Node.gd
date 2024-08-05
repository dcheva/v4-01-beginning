extends KinematicBody2D

var velocity = Vector2(0,0)
var speed = 300
var jump_speed = 1000
var gravity = 2000

func _physics_process(_delta):
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y= -jump_speed
	if Input.is_action_pressed("jump"):
		$Sprite.play("Jump-up")
	elif Input.is_action_pressed("left_arrow"):
		$Sprite.play("Roll-left")
		velocity.x = -speed
	elif Input.is_action_pressed("right_arrow"):
		$Sprite.play("Roll-right")
		velocity.x = speed
	elif velocity == Vector2(0,0):
		 $Sprite.play("Idle")
		
	velocity.y = velocity.y + gravity * (_delta)
	velocity.x = lerp(velocity.x, 0, _delta * 4)
	move_and_slide(velocity, Vector2.UP)

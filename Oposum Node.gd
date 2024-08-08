extends KinematicBody2D

var velocity = Vector2(0,0)
var speed = 100
var direction = -1
var lives = 3

func _physics_process(_delta):
	velocity.x = speed * direction

	if direction == 1:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false

	$AnimationPlayer.play("Oposun walk")
	move_and_slide(velocity)

	if $RayCast2D.is_colliding() == false:
		direction = direction * -1
		$RayCast2D.position.x *= -1

func _on_CollisionChecker_body_entered(_body):
	print("Bounced enemy")
	lives -= 1
	prints("Lives: ", lives)
	if(lives == 0):      
		get_tree().change_scene("res://Scene.tscn")
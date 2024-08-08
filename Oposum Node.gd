extends KinematicBody2D

var velocity = Vector2(0,0)
var speed = 200
var direction = -1

func _physics_process(_delta):
	velocity.x = speed * direction
	
	if direction == 1:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
		
	$AnimationPlayer.play("Oposun walk")
	move_and_slide(velocity)

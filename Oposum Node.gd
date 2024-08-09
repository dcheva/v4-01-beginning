extends KinematicBody2D

var velocity = Vector2(0,0)
var speed = 100
var direction = -1

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

# Hurt hit bumper
func _on_CollisionChecker_body_entered(body):
	var x1 = body.get("global_position").x
	var x0 = global_position.x
	var dx = 1
	if x1 < x0: 
		dx = -1
	body.hit(dx)

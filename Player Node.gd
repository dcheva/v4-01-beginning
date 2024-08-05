extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2(0,0)
var speed = 300


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("left_arrow"):
		$Sprite.play("Roll-left")
		velocity.x = -speed
	elif Input.is_action_pressed("right_arrow"):
		$Sprite.play("Roll-right")
		velocity.x = speed
	else:
		$Sprite.play("Idle")
	
	move_and_slide(velocity)
	
	velocity.x = lerp(velocity.x, 0, delta*4)

extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2(0,0)
var speed = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("left_arrow"):
		velocity.x = -speed
	if Input.is_action_pressed("right_arrow"):
		velocity.x = speed
	
	move_and_slide(velocity)
	
	velocity.x = lerp(velocity.x,0,0.1)

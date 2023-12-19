extends Node2D

var velocity: Vector2
var speed = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("Left")):
		velocity += Vector2(-speed, 0)
		
		#animator.play("Walk")
	elif(Input.is_action_pressed("Right")):
		velocity += Vector2(speed, 0)
		
		#animator.play("Walk")
	if(Input.is_action_pressed("Up")):
		velocity += Vector2(0, -speed)
		
		#animator.play("Walk")
	elif(Input.is_action_pressed("Down")):
		velocity += Vector2(0, speed)
		
	position += velocity


extends CharacterBody2D

var animator
var mouse_position


var bulletPath = preload("res://Scenes/Bullet.tscn")
var gun

#character properties
@export var health: int = 5
@export var speed: int = 200

#bullet properties
var bullet_speed = 300
var bullet_damage = 50

func _ready():
	gun = $Gun
	animator = get_node("AnimatedSprite2D/AnimationPlayer")




func _process(delta):
	if(health <= 0):
		queue_free()
	animator.play("Idle")
	mouse_position = get_global_mouse_position()
	var direction = (mouse_position-position).normalized()
	velocity = Vector2(0,0)
	
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
		
	if (Input.is_action_just_pressed("Left_Click")):
		shoot()
	
	velocity.normalized()
	move_and_slide()
	look_at(mouse_position)
	

func shoot():
	var bullet = bulletPath.instantiate()
	
	bullet.speed = bullet_speed
	bullet.damage = bullet_damage
	bullet.position = gun.global_position
	bullet.direction = (mouse_position - bullet.position).normalized()
	get_parent().add_child(bullet)



func _on_area_2d_area_entered(area):
	var parent_node = area.get_parent()
	if parent_node.is_in_group("Monster"):
		health -= parent_node.damage

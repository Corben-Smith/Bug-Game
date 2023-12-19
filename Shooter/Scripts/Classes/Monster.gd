class_name Monster
extends Node2D

@onready var area2D = $Area2D
@onready var nav: NavigationAgent2D = $NavigationAgent2D
@export var player: CharacterBody2D


var health: int
var speed: int
var damage: int

var direction

func _ready():
	pass

func _physics_process(delta):
	$Area2D/Label.text = "%s" % health
	
	nav.target_position = player.global_position
	
	direction = (nav.get_next_path_position() - global_position).normalized()
	look_at(nav.get_next_path_position())
	
	position += direction * delta * speed
	
	if(health <= 0):
		_die()

func _on_area_2d_area_entered(area):
	var parent_node =  area.get_parent()
	print_debug("Hit")

	if parent_node.is_in_group("Projectile"):
		health -= parent_node.damage
		parent_node._hit()

func _die():
	queue_free()

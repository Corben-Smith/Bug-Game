class_name Projectile
extends Node2D

#varibles for basic bullet qualities
var speed: float
var damage: float

var direction = Vector2.ZERO

@onready var area2D = $Area2D 

func _ready():
	pass

func _physics_process(delta):
	position += direction * speed * delta


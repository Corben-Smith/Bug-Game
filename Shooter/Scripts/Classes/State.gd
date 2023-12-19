extends Node
class_name State

signal transitioned

var player: CharacterBody2D
var enemy: Node2D

func _ready():
	player = get_tree().get_first_node_in_group("Character")
	enemy = get_parent().get_parent()

func Enter():
	pass

func Exit():
	pass

func Update(delta):
	pass

func Physics_Update(delta):
	pass


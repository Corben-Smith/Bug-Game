extends Node

var spiderPath = preload("res://Scenes/Spider.tscn")
@onready var timer = $Timer
@export var player: CharacterBody2D

var spawn = false
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	randomize()
	
	if(Input.is_action_just_released("Space")):
		spawn = !spawn


func _on_timer_timeout():
	if spawn:
		monster_spawn()

func monster_spawn():
	var spider = spiderPath.instantiate()
	spider.player =  player
	get_parent().add_child(spider)
	spider.position = Vector2(randi_range(0,get_viewport().size.x), randi_range(0,get_viewport().size.y))

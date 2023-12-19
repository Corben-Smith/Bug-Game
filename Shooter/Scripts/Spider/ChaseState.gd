extends State
class_name ChaseState

var nav: NavigationAgent2D

func Enter():
	nav = get_parent().get_parent().get_node("NavigationAgent2D")

func Physics_Update(delta):
	nav.target_position = player.global_position
	
	enemy.direction = (nav.get_next_path_position() - enemy.global_position).normalized()
	enemy.look_at(nav.get_next_path_position())
	
	if Input.is_action_just_pressed("Space"):
		pass


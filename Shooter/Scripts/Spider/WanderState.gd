extends State
class_name WanderState

var nav: NavigationAgent2D
var wander_timer: float


func Enter():
	nav = get_parent().get_parent().get_node("NavigationAgent2D")
	wander_timer = 3

func Physics_Update(delta):
	
	randomize()
	if(nav.target_reached || !nav.is_target_reachable()):
		nav.target_position = Vector2(enemy.position.x + randi_range(-50,50), enemy.position.y + randi_range(-50,50))
	
	if(nav.is_target_reachable() && wander_timer < 0):
		enemy.direction = (nav.get_next_path_position() - enemy.global_position).normalized()


func Update(delta):
	if wander_timer > 0:
		wander_timer -= delta
	else:
		wander_timer = 1

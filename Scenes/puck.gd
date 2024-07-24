extends RigidBody2D

var p1score = 0
var p2score = 0

const initial_pos = Vector2(576, 359)

var physics_frozen = false

func _integrate_forces(state):
	if physics_frozen:
		physics_frozen = false
		state.linear_velocity = Vector2.ZERO
		state.angular_velocity = 0
		await get_tree().create_timer(3.0).timeout
		state.transform.origin = initial_pos


func despawn():
	queue_free()


func _end_of_regulation():
	physics_frozen = true


# when player 2 scores a goal
func _on_goal_detector_left_body_entered(body):
	p2score += 1
	physics_frozen = true


# when player 1 scores a goal
func _on_goal_detector_right_body_entered(body):
	p1score += 1 
	physics_frozen = true

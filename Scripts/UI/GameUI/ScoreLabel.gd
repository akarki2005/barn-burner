extends Label

var p1score = 0
var p2score = 0

func _on_goal_detector_body_entered(body):
	if body is RigidBody2D:
		p2score += 1
		text = "%s:%s" % [p1score, p2score]


func _on_goal_detector_2_body_entered(body):
	if body is RigidBody2D:
		p1score += 1
		text = "%s:%s" % [p1score, p2score]

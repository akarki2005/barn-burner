extends Sprite2D

var dormantpos = Vector2(100, -40)

var p1pos = Vector2(426, 106)
var p2pos = Vector2(726, 106)

func _on_goal_scored(scorer):
	# precondition: scorer == 'p1' or scorer == 'p2'
	if scorer == 'p1':
		position = p1pos
	else:
		position = p2pos
	await get_tree().create_timer(3.0, false).timeout
	position = dormantpos

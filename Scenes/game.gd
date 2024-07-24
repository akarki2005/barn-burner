extends Node2D

var p1score = 0
var p2score = 0
var ot = false

func game_over():
	await get_tree().create_timer(3.0).timeout
	get_tree().paused = true


func _on_goal_scored(scorer):
	# precondition: scorer == 'p1' or scorer == 'p2'
	if scorer == 'p1':
		p1score += 1
	else:
		p2score += 1
	if ot:
		game_over()

func _on_goal_detector_left_body_entered(body):
	_on_goal_scored('p2')


func _on_goal_detector_right_body_entered(body):
	_on_goal_scored('p1')


func _on_game_clock_timeout():
	var player1 = $Player1
	var player2 = $Player2
	var puck = $Puck
	player1._end_of_regulation()
	player2._end_of_regulation()
	puck._end_of_regulation()
	if p1score != p2score:
		game_over()
	else:
		ot = true

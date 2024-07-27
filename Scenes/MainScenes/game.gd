extends Node2D

var p1score = 0
var p2score = 0
var ot = false

func game_over():
	await get_tree().create_timer(3.0).timeout
	get_tree().paused = true


func _ready():
	var gamealertlabel = $UserInterface/GameAlertLabel
	var gamealert = $UserInterface/GameAlert
	gamealertlabel._alert('faceoff')
	gamealert._alert('faceoff')
	var p1teamlabel = $UserInterface/P1TeamLabel
	var p2teamlabel = $UserInterface/P2TeamLabel
	var p1_team_number = GameVariables.p1_team_number
	var p2_team_number = GameVariables.p2_team_number
	p1teamlabel.text = GameVariables.globalTeamSpritesheet[p1_team_number][0]
	p2teamlabel.text = GameVariables.globalTeamSpritesheet[p2_team_number][0]


func _on_goal_scored(scorer):
	# precondition: scorer == 'p1' or scorer == 'p2'
	var gamealertlabel = $UserInterface/GameAlertLabel
	var gamealert = $UserInterface/GameAlert
	if scorer == 'p1' and not ot:
		p1score += 1
		await get_tree().create_timer(3.0).timeout
		gamealertlabel._alert('faceoff')
		gamealert._alert('faceoff')
	elif not ot:
		p2score += 1
		await get_tree().create_timer(3.0).timeout
		gamealertlabel._alert('faceoff')
		gamealert._alert('faceoff')
	else:
		gamealertlabel._alert('gameover_ot')
		gamealert._alert('gameover_ot')
		game_over()

func _on_goal_detector_left_body_entered(body):
	_on_goal_scored('p2')


func _on_goal_detector_right_body_entered(body):
	_on_goal_scored('p1')


func _on_game_clock_timeout():
	var player1 = $Player1
	var player2 = $Player2
	var puck = $Puck
	var gamealertlabel = $UserInterface/GameAlertLabel
	var gamealert = $UserInterface/GameAlert
	player1._end_of_regulation()
	player2._end_of_regulation()
	puck._end_of_regulation()
	if p1score != p2score:
		gamealert._alert('gameover_reg')
		gamealertlabel._alert('gameover_reg')
		game_over()
	else:
		gamealert._alert('end_of_reg')
		gamealertlabel._alert('end_of_reg')
		ot = true
		await get_tree().create_timer(3.0).timeout
		gamealertlabel._alert('faceoff')
		gamealert._alert('faceoff')

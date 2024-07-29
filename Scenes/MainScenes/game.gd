extends Node2D

var p1score = 0
var p2score = 0
var ot = false

var teams = 32

@onready var pause_menu = $UserInterface/PauseMenu
@onready var end_game_menu = $UserInterface/EndGameMenu

func game_over():
	GameVariables.gameover = true
	if ot:
		await get_tree().create_timer(4.0, false).timeout
	else:
		await get_tree().create_timer(1.0, false).timeout
	pause_menu.queue_free()
	end_game_menu.visible = true


func _ready():
	GameVariables.p1_score = 0
	GameVariables.p2_score = 0
	GameVariables.gameover = false
	var gamealertlabel = $UserInterface/GameAlertLabel
	var gamealert = $UserInterface/GameAlert
	gamealertlabel._alert('faceoff')
	gamealert._alert('faceoff')
	var p1teamlabel = $UserInterface/P1TeamLabel
	var p2teamlabel = $UserInterface/P2TeamLabel
	var p1_team_number = GameVariables.p1_team_number
	var p2_team_number = GameVariables.p2_team_number
	p1teamlabel.text = GameVariables.globalTeamSpritesheet[p1_team_number % teams][0]
	p2teamlabel.text = GameVariables.globalTeamSpritesheet[p2_team_number % teams][0]


func _on_goal_scored(scorer):
	# precondition: scorer == 'p1' or scorer == 'p2'
	var gamealertlabel = $UserInterface/GameAlertLabel
	var gamealert = $UserInterface/GameAlert
	if scorer == 'p1' and not ot:
		p1score += 1
		await get_tree().create_timer(3.0, false).timeout
		gamealertlabel._alert('faceoff')
		gamealert._alert('faceoff')
	elif not ot:
		p2score += 1
		await get_tree().create_timer(3.0, false).timeout
		gamealertlabel._alert('faceoff')
		gamealert._alert('faceoff')
	else:
		gamealertlabel._alert('gameover_ot')
		gamealert._alert('gameover_ot')
		game_over()
	GameVariables.p1_score = p1score
	GameVariables.p2_score = p2score

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
		await get_tree().create_timer(3.0, false).timeout
		gamealertlabel._alert('faceoff')
		gamealert._alert('faceoff')

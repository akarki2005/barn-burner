extends Node2D

var p1score = 0
var p2score = 0
var ot = false

var teams = 32

var boost_meter_frames = 36

const boost_meter_sprites = [
	preload("res://Sprites/playerInfoSprites/boost_bar_regen.bmp"),
	preload("res://Sprites/playerInfoSprites/boost_bar_deplete.bmp"),
	preload("res://Sprites/playerInfoSprites/boost_bar_locked.bmp")
]

@onready var pause_menu = $UserInterface/PauseMenu
@onready var end_game_menu = $UserInterface/EndGameMenu

func game_over():
	GameVariables.gameover = true
	if ot:
		await get_tree().create_timer(3.0, false).timeout
		SeriesInfoDisplay.update_wins()
		$UserInterface/EndGameMenu/Panel/VBoxContainer/RematchButton.check_win_cond()
		$UserInterface/SeriesInfoLabel.update()
		SeriesInfoDisplay.update_curr_game()
		await get_tree().create_timer(1.0, false).timeout
	else:
		SeriesInfoDisplay.update_wins()
		$UserInterface/EndGameMenu/Panel/VBoxContainer/RematchButton.check_win_cond()
		$UserInterface/SeriesInfoLabel.update()
		SeriesInfoDisplay.update_curr_game()
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
	p1teamlabel.text = GameVariables.teamCitiesAndAbbreviations[p1_team_number % teams][1]
	p2teamlabel.text = GameVariables.teamCitiesAndAbbreviations[p2_team_number % teams][1]
	
	# initialize boost meters
	var p1_boost_meter = $UserInterface/P1BoostMeter
	var p2_boost_meter = $UserInterface/P2BoostMeter
	
	$Goalie1.goalie = true
	$Goalie2.goalie = true
	
	if not GameVariables.game_mode_is_chaos:
		$Goalie1.queue_free()
		$Goalie2.queue_free()


func _physics_process(delta):
	boost_display_helper()


func boost_display_helper():
	
	# Player 1
	if $Player1.prev_boosting:
		$UserInterface/P1BoostMeter.texture = boost_meter_sprites[1]
	elif $Player1.lock_boost:
		$UserInterface/P1BoostMeter.texture = boost_meter_sprites[2]
	else:
		$UserInterface/P1BoostMeter.texture = boost_meter_sprites[0]
	$UserInterface/P1BoostMeter.frame = ceil(boost_meter_frames * ($Player1.curr_boost / $Player1.max_boost))
	$UserInterface/P1BoostMeter/P1BoostLabel.text = str(ceil($Player1.curr_boost))
	
	# Player 2
	if $Player2.prev_boosting:
		$UserInterface/P2BoostMeter.texture = boost_meter_sprites[1]
	elif $Player2.lock_boost:
		$UserInterface/P2BoostMeter.texture = boost_meter_sprites[2]
	else:
		$UserInterface/P2BoostMeter.texture = boost_meter_sprites[0]
	$UserInterface/P2BoostMeter.frame = ceil(boost_meter_frames * ($Player2.curr_boost / $Player2.max_boost))
	$UserInterface/P2BoostMeter/P2BoostLabel.text = str(ceil($Player2.curr_boost))


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
		if scorer == 'p1':
			p1score += 1
		else:
			p2score += 1
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
	$UserInterface/TimeDisplay.text = '0:00'
	var player1 = $Player1
	var player2 = $Player2
	var puck = $Puck
	var gamealertlabel = $UserInterface/GameAlertLabel
	var gamealert = $UserInterface/GameAlert
	player1._end_of_regulation()
	player2._end_of_regulation()
	
	if GameVariables.game_mode_is_chaos:
		var goalie1 = $Goalie1
		var goalie2 = $Goalie2
		goalie1._end_of_regulation()
		goalie2._end_of_regulation()
	
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
		$UserInterface/TimeDisplay.text = 'OT'

extends Node2D

@onready var p1_preview = $P1Preview
@onready var p2_preview = $P2Preview
@onready var p1_team = $Control/P1Team
@onready var p2_team = $Control/P2Team

var p1_curr_team = GameVariables.p1_team_number
var p2_curr_team = GameVariables.p2_team_number

func _ready():
	# set p1 and p2 to home and away pusher previews respectively
	p1_preview.texture = load("res://Sprites/teamSprites/pushers_away.bmp")
	p2_preview.texture = load("res://Sprites/teamSprites/pushers_home.bmp")
	# display current pusher
	p1_preview.frame = p1_curr_team % GameVariables.num_teams
	p2_preview.frame = p2_curr_team % GameVariables.num_teams
	# show city name of current pusher
	p1_team.text = GameVariables.teamCitiesAndAbbreviations[p1_curr_team % GameVariables.num_teams][0]
	p2_team.text = GameVariables.teamCitiesAndAbbreviations[p2_curr_team % GameVariables.num_teams][0]


func _process(_delta):
	if Input.is_action_just_pressed("leftp1"):
		cycle_team(1, 'left')
	elif Input.is_action_just_pressed("rightp1"):
		cycle_team(1, 'right')
	if Input.is_action_just_pressed("leftp2"):
		cycle_team(2, 'left')
	elif Input.is_action_just_pressed("rightp2"):
		cycle_team(2, 'right')


func _on_p1_left_arrow_pressed():
	cycle_team(1, 'left')


func _on_p1_right_arrow_pressed():
	cycle_team(1, 'right')


func _on_p2_left_arrow_pressed():
	cycle_team(2, 'left')


func _on_p2_right_arrow_pressed():
	cycle_team(2, 'right')


func _on_play_button_pressed():
	GameVariables.p1_team_number = p1_curr_team
	GameVariables.p2_team_number = p2_curr_team
	get_tree().change_scene_to_file("res://Scenes/MainScenes/game.tscn")
	
	GameFunctions.set_ads()


func cycle_team(player : int, direction : String):
	if player == 1:
		if direction == 'left':
			p1_curr_team -= 1
			# workaround for GDScript modulo operator not wrapping with negatives
			if p1_curr_team == -1:
				p1_curr_team = 31
			p1_preview.frame = p1_curr_team % GameVariables.num_teams
			p1_team.text = GameVariables.teamCitiesAndAbbreviations[p1_curr_team % GameVariables.num_teams][0]
		else:
			p1_curr_team += 1
			p1_preview.frame = p1_curr_team % GameVariables.num_teams
			p1_team.text = GameVariables.teamCitiesAndAbbreviations[p1_curr_team % GameVariables.num_teams][0]
	else:
		if direction == 'left':
			p2_curr_team -= 1
			# workaround for GDScript modulo operator not wrapping with negatives
			if p2_curr_team == -1:
				p2_curr_team = 31
			p2_preview.frame = p2_curr_team % GameVariables.num_teams
			p2_team.text = GameVariables.teamCitiesAndAbbreviations[p2_curr_team % GameVariables.num_teams][0]
		else:
			p2_curr_team += 1
			p2_preview.frame = p2_curr_team % GameVariables.num_teams
			p2_team.text = GameVariables.teamCitiesAndAbbreviations[p2_curr_team % GameVariables.num_teams][0]
	# make sure team numbers are in range of 0, 31
	if p1_curr_team > 31:
		p1_curr_team = p1_curr_team % GameVariables.num_teams
	if p2_curr_team > 31:
		p2_curr_team = p2_curr_team % GameVariables.num_teams


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainScenes/title_screen.tscn")

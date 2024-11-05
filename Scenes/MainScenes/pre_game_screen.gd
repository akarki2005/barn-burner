extends Node2D

@onready var p1_preview = $P1Preview
@onready var p2_preview = $P2Preview
@onready var p1_team = $Control/P1Team
@onready var p2_team = $Control/P2Team

var p1_curr_team = GameVariables.p1_team_number
var p2_curr_team = GameVariables.p2_team_number
var num_of_teams = 32

func _ready():
	p1_preview.frame = p1_curr_team % num_of_teams
	p2_preview.frame = p2_curr_team % num_of_teams
	p1_team.text = GameVariables.teamCitiesAndAbbreviations[p1_curr_team % num_of_teams][0]
	p2_team.text = GameVariables.teamCitiesAndAbbreviations[p2_curr_team % num_of_teams][0]


func _on_p1_left_arrow_pressed():
	p1_curr_team -= 1
	# workaround for GDScript modulo operator not wrapping with negatives
	if p1_curr_team == -1:
		p1_curr_team = 31
	p1_preview.frame = p1_curr_team % num_of_teams
	p1_team.text = GameVariables.teamCitiesAndAbbreviations[p1_curr_team % num_of_teams][0]


func _on_p1_right_arrow_pressed():
	p1_curr_team += 1
	p1_preview.frame = p1_curr_team % num_of_teams
	p1_team.text = GameVariables.teamCitiesAndAbbreviations[p1_curr_team % num_of_teams][0]


func _on_p2_left_arrow_pressed():
	p2_curr_team -= 1
	# workaround for GDScript modulo operator not wrapping with negatives
	if p2_curr_team == -1:
		p2_curr_team = 31
	p2_preview.frame = p2_curr_team % num_of_teams
	p2_team.text = GameVariables.teamCitiesAndAbbreviations[p2_curr_team % num_of_teams][0]


func _on_p2_right_arrow_pressed():
	p2_curr_team += 1
	p2_preview.frame = p2_curr_team % num_of_teams
	p2_team.text = GameVariables.teamCitiesAndAbbreviations[p2_curr_team % num_of_teams][0]


func _on_play_button_pressed():
	GameVariables.p1_team_number = p1_curr_team
	GameVariables.p2_team_number = p2_curr_team
	get_tree().change_scene_to_file("res://Scenes/MainScenes/game.tscn")



func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainScenes/title_screen.tscn")

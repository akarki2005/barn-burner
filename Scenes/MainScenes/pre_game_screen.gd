extends Node2D

@onready var p1_preview = $P1Preview
@onready var p2_preview = $P2Preview
@onready var p1_team = $Control/P1Team
@onready var p2_team = $Control/P2Team

const teamNamesAndSprites = {
	0 : ['ANAHEIM', preload("res://Sprites/teamSprites/ANA.bmp")],
	1 : ['BOSTON', preload("res://Sprites/teamSprites/BOS.bmp")],
	2 : ['BUFFALO', preload("res://Sprites/teamSprites/BUF.bmp")],
	3 : ['CAROLINA', preload("res://Sprites/teamSprites/CAR.bmp")],
	4 : ['COLUMBUS', preload("res://Sprites/teamSprites/CBJ.bmp")],
	5 : ['CALGARY', preload("res://Sprites/teamSprites/CGY.bmp")],
	6 : ['CHICAGO', preload("res://Sprites/teamSprites/CHI.bmp")],
	7 : ['COLORADO', preload("res://Sprites/teamSprites/COL.bmp")],
	8 : ['DALLAS', preload("res://Sprites/teamSprites/DAL.bmp")],
	9 : ['DETROIT', preload("res://Sprites/teamSprites/DET.bmp")],
	10 : ['EDMONTON', preload("res://Sprites/teamSprites/EDM.bmp")],
	11 : ['FLORIDA', preload("res://Sprites/teamSprites/FLA.bmp")],
	12 : ['LOS ANGELES', preload("res://Sprites/teamSprites/LAK.bmp")],
	13 : ['MINNESOTA', preload("res://Sprites/teamSprites/MIN.bmp")],
	14 : ['MONTREAL', preload("res://Sprites/teamSprites/MTL.bmp")],
	15 : ['NEW JERSEY', preload("res://Sprites/teamSprites/NJD.bmp")],
	16 : ['NASHVILLE', preload("res://Sprites/teamSprites/NSH.bmp")],
	17 : ['NEW YORK (NYI)', preload("res://Sprites/teamSprites/NYI.bmp")],
	18 : ['NEW YORK (NYR)', preload("res://Sprites/teamSprites/NYR.bmp")],
	19 : ['OTTAWA', preload("res://Sprites/teamSprites/OTT.bmp")],
	20 : ['PHILADELPHIA', preload("res://Sprites/teamSprites/PHI.bmp")],
	21 : ['PITTSBURGH', preload("res://Sprites/teamSprites/PIT.bmp")],
	22 : ['SEATTLE', preload("res://Sprites/teamSprites/SEA.bmp")],
	23 : ['SAN JOSE', preload("res://Sprites/teamSprites/SJS.bmp")],
	24 : ['ST LOUIS', preload("res://Sprites/teamSprites/STL.bmp")],
	25 : ['TAMPA', preload("res://Sprites/teamSprites/TBL.bmp")],
	26 : ['TORONTO', preload("res://Sprites/teamSprites/TOR.bmp")],
	27 : ['UTAH', preload("res://Sprites/teamSprites/UTA.bmp")],
	28 : ['VANCOUVER', preload("res://Sprites/teamSprites/VAN.bmp")],
	29 : ['VEGAS', preload("res://Sprites/teamSprites/VGK.bmp")],
	30 : ['WINNIPEG', preload("res://Sprites/teamSprites/WPG.bmp")],
	31 : ['WASHINGTON', preload("res://Sprites/teamSprites/WSH.bmp")],
}

var p1_curr_team = GameVariables.p1_team_number
var p2_curr_team = GameVariables.p2_team_number
var num_of_teams = 32

func _ready():
	p1_preview.texture = teamNamesAndSprites[p1_curr_team % num_of_teams][1]
	p2_preview.texture = teamNamesAndSprites[p2_curr_team % num_of_teams][1]
	p1_team.text = teamNamesAndSprites[p1_curr_team % num_of_teams][0]
	p2_team.text = teamNamesAndSprites[p2_curr_team % num_of_teams][0]


func _on_p1_left_arrow_pressed():
	p1_curr_team -= 1
	# workaround for GDScript modulo operator not wrapping with negatives
	if p1_curr_team == -1:
		p1_curr_team = 31
	p1_preview.texture = teamNamesAndSprites[p1_curr_team % num_of_teams][1]
	p1_team.text = teamNamesAndSprites[p1_curr_team % num_of_teams][0]


func _on_p1_right_arrow_pressed():
	p1_curr_team += 1
	p1_preview.texture = teamNamesAndSprites[p1_curr_team % num_of_teams][1]
	p1_team.text = teamNamesAndSprites[p1_curr_team % num_of_teams][0]


func _on_p2_left_arrow_pressed():
	p2_curr_team -= 1
	# workaround for GDScript modulo operator not wrapping with negatives
	if p2_curr_team == -1:
		p2_curr_team = 31
	p2_preview.texture = teamNamesAndSprites[p2_curr_team % num_of_teams][1]
	p2_team.text = teamNamesAndSprites[p2_curr_team % num_of_teams][0]


func _on_p2_right_arrow_pressed():
	p2_curr_team += 1
	p2_preview.texture = teamNamesAndSprites[p2_curr_team % num_of_teams][1]
	p2_team.text = teamNamesAndSprites[p2_curr_team % num_of_teams][0]


func _on_play_button_pressed():
	GameVariables.p1_team_number = p1_curr_team
	GameVariables.p2_team_number = p2_curr_team
	get_tree().change_scene_to_file("res://Scenes/MainScenes/game.tscn")

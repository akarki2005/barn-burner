extends Sprite2D

func _ready():
	texture = load("res://Sprites/teamSprites/pushers_home.bmp")
	if GameVariables.home_team == 2:
		frame = GameVariables.p2_team_number % GameVariables.num_teams
	else:
		frame = GameVariables.p1_team_number % GameVariables.num_teams

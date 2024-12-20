extends Sprite2D

func _ready():
	texture = load("res://Sprites/teamSprites/pushers_home.bmp")
	frame = GameVariables.p2_team_number % GameVariables.num_teams

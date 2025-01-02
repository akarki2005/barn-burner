extends Node2D

func _ready():
	if GameVariables.home_team == 1:
		$TopLeft.texture = GameVariables.ads[GameVariables.p1_ad_numbers[0]]
		$TopRight.texture = GameVariables.ads[GameVariables.p1_ad_numbers[1]]
		$BottomLeft.texture = GameVariables.ads[GameVariables.p1_ad_numbers[2]]
		$BottomRight.texture = GameVariables.ads[GameVariables.p1_ad_numbers[3]]
	else:
		$TopLeft.texture = GameVariables.ads[GameVariables.p2_ad_numbers[0]]
		$TopRight.texture = GameVariables.ads[GameVariables.p2_ad_numbers[1]]
		$BottomLeft.texture = GameVariables.ads[GameVariables.p2_ad_numbers[2]]
		$BottomRight.texture = GameVariables.ads[GameVariables.p2_ad_numbers[3]]

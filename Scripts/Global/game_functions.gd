extends Node

class_name GameFunctions

static func toggle_fullscreen_mode():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)

static func reset_series_variables():
	SeriesVariables.p1_wins = 0
	SeriesVariables.p2_wins = 0
	SeriesVariables.curr_game = 1
	

static func set_home_team():
	if SeriesVariables.series_length == 1:
		GameVariables.home_team = 2
	elif SeriesVariables.series_length == 3:
		if [1, 3].has(SeriesVariables.curr_game):
			GameVariables.home_team = 2
		else:
			GameVariables.home_team = 1
	elif SeriesVariables.series_length == 5:
		if [1, 2, 5].has(SeriesVariables.curr_game):
			GameVariables.home_team = 2
		else:
			GameVariables.home_team = 1
	else:
		if [1, 2, 5, 7].has(SeriesVariables.curr_game):
			GameVariables.home_team = 2
		else:
			GameVariables.home_team = 1
		

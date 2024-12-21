extends Button

var reset_series_variables: bool = false

func check_win_cond():
	if SeriesVariables.p1_wins < ceil(SeriesVariables.series_length / 2.0) and SeriesVariables.p2_wins < ceil(SeriesVariables.series_length / 2.0):
		text = "CONTINUE TO GAME " + str(SeriesVariables.curr_game  + 1)
		reset_series_variables = false
	elif SeriesVariables.series_length > 1:
		text = "REPLAY SERIES"
		reset_series_variables = true
	else:
		text = "REMATCH"
		reset_series_variables = true


func _on_pressed():
	if reset_series_variables:
		GameFunctions.reset_series_variables()
	GameFunctions.set_home_team()

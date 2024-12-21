extends Node

static func get_best_of():
	return "Best of " + str(SeriesVariables.series_length)


static func get_info():
	# if a team has won the majority of the games in a series, declare them the winners
	if SeriesVariables.p1_wins == ceil(SeriesVariables.series_length / 2.0) or SeriesVariables.p2_wins == ceil(SeriesVariables.series_length / 2.0):
		if SeriesVariables.p1_wins > SeriesVariables.p2_wins:
			var p1_abbrev = GameVariables.teamCitiesAndAbbreviations[GameVariables.p1_team_number][1]
			return p1_abbrev + " wins " + str(SeriesVariables.p1_wins) + "-" + str(SeriesVariables.p2_wins)
		else:
			var p2_abbrev = GameVariables.teamCitiesAndAbbreviations[GameVariables.p2_team_number][1]
			return p2_abbrev + " wins " + str(SeriesVariables.p2_wins) + "-" + str(SeriesVariables.p1_wins)
	# if first or last game of series, just say the game number
	elif (SeriesVariables.curr_game == 1 or SeriesVariables.curr_game == SeriesVariables.series_length) and SeriesVariables.p1_wins == SeriesVariables.p2_wins:
		return "Game " + str(SeriesVariables.curr_game)
	# elif series is tied, say that it's tied
	elif SeriesVariables.p1_wins == SeriesVariables.p2_wins:
		return "Series tied " + str(SeriesVariables.p1_wins) + "-" + str(SeriesVariables.p2_wins)
	# else, say who is winning the series and by how much
	else:
		if SeriesVariables.p1_wins > SeriesVariables.p2_wins:
			var p1_abbrev = GameVariables.teamCitiesAndAbbreviations[GameVariables.p1_team_number][1]
			return p1_abbrev + " leads " + str(SeriesVariables.p1_wins) + "-" + str(SeriesVariables.p2_wins)
		else:
			var p2_abbrev = GameVariables.teamCitiesAndAbbreviations[GameVariables.p2_team_number][1]
			return p2_abbrev + " leads " + str(SeriesVariables.p2_wins) + "-" + str(SeriesVariables.p1_wins)


# called after the end of every game
static func update_wins():
	if GameVariables.p1_score > GameVariables.p2_score:
		SeriesVariables.p1_wins += 1
	else:
		SeriesVariables.p2_wins += 1


static func update_curr_game():
	if SeriesVariables.curr_game < SeriesVariables.series_length:
		SeriesVariables.curr_game += 1

extends Node

# determines what sprite is used for player, as well as team abbreviation on scoreboard
var p1_team_number: int = 0
var p2_team_number: int = 0

var p1_score: int = 0
var p2_score: int = 0

const p1initial_pos = Vector2(300, 324)
const p2initial_pos = Vector2(852, 324)

const num_teams = 32

var gameover = false

const teamCitiesAndAbbreviations = [
	['ANAHEIM', 'ANA'],
	['BOSTON', 'BOS'],
	['BUFFALO', 'BUF'],
	['CALGARY', 'CGY'],
	['CAROLINA', 'CAR'],
	['CHICAGO', 'CHI'],
	['COLORADO', 'COL'],
	['COLUMBUS', 'CBJ'],
	['DALLAS', 'DAL'],
	['DETROIT', 'DET'],
	['EDMONTON', 'EDM'],
	['FLORIDA', 'FLA'],
	['LOS ANGELES', 'LAK'],
	['MINNESOTA', 'MIN'],
	['MONTREAL', 'MTL'],
	['NASHVILLE', 'NSH'],
	['NEW JERSEY', 'NJD'],
	['NEW YORK (NYI)', 'NYI'],
	['NEW YORK (NYR)', 'NYR'],
	['OTTAWA', 'OTT'],
	['PHILADELPHIA', 'PHI'],
	['PITTSBURGH', 'PIT'],
	['SAINT LOUIS', 'STL'],
	['SAN JOSE', 'SJS'],
	['SEATTLE', 'SEA'],
	['TAMPA BAY', 'TBL'],
	['TORONTO', 'TOR'],
	['UTAH', 'UTA'],
	['VANCOUVER', 'VAN'],
	['VEGAS', 'VGK'],
	['WINNIPEG', 'WPG'],
	['WASHINGTON', 'WSH']
]

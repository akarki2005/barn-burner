extends Node

# determines what sprite is used for player, as well as team abbreviation on scoreboard
var p1_team_number: int = 0
var p2_team_number: int = 0

var globalTeamSpritesheet = {
	0 : ['ANA', preload("res://Sprites/teamSprites/ANA.bmp")],
	1 : ['BOS', preload("res://Sprites/teamSprites/BOS.bmp")],
	2 : ['BUF', preload("res://Sprites/teamSprites/BUF.bmp")],
	3 : ['CAR', preload("res://Sprites/teamSprites/CAR.bmp")],
	4 : ['CBJ', preload("res://Sprites/teamSprites/CBJ.bmp")],
	5 : ['CGY', preload("res://Sprites/teamSprites/CGY.bmp")],
	6 : ['CHI', preload("res://Sprites/teamSprites/CHI.bmp")],
	7 : ['COL', preload("res://Sprites/teamSprites/COL.bmp")],
	8 : ['DAL', preload("res://Sprites/teamSprites/DAL.bmp")],
	9 : ['DET', preload("res://Sprites/teamSprites/DET.bmp")],
	10 : ['EDM', preload("res://Sprites/teamSprites/EDM.bmp")],
	11 : ['FLA', preload("res://Sprites/teamSprites/FLA.bmp")],
	12 : ['LAK', preload("res://Sprites/teamSprites/LAK.bmp")],
	13 : ['MIN', preload("res://Sprites/teamSprites/MIN.bmp")],
	14 : ['MTL', preload("res://Sprites/teamSprites/MTL.bmp")],
	15 : ['NJD', preload("res://Sprites/teamSprites/NJD.bmp")],
	16 : ['NSH', preload("res://Sprites/teamSprites/NSH.bmp")],
	17 : ['NYI', preload("res://Sprites/teamSprites/NYI.bmp")],
	18 : ['NYR', preload("res://Sprites/teamSprites/NYR.bmp")],
	19 : ['OTT', preload("res://Sprites/teamSprites/OTT.bmp")],
	20 : ['PHI', preload("res://Sprites/teamSprites/PHI.bmp")],
	21 : ['PIT', preload("res://Sprites/teamSprites/PIT.bmp")],
	22 : ['SEA', preload("res://Sprites/teamSprites/SEA.bmp")],
	23 : ['SJS', preload("res://Sprites/teamSprites/SJS.bmp")],
	24 : ['STL', preload("res://Sprites/teamSprites/STL.bmp")],
	25 : ['TBL', preload("res://Sprites/teamSprites/TBL.bmp")],
	26 : ['TOR', preload("res://Sprites/teamSprites/TOR.bmp")],
	27 : ['UTA', preload("res://Sprites/teamSprites/UTA.bmp")],
	28 : ['VAN', preload("res://Sprites/teamSprites/VAN.bmp")],
	29 : ['VGK', preload("res://Sprites/teamSprites/VGK.bmp")],
	30 : ['WPG', preload("res://Sprites/teamSprites/WPG.bmp")],
	31 : ['WSH', preload("res://Sprites/teamSprites/WSH.bmp")],
}

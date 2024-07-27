extends Node

# determines what sprite is used for player, as well as team abbreviation on scoreboard
var p1_team_number: int = 0
var p2_team_number: int = 0

var globalTeamSpritesheet = {
	0 : preload("res://Sprites/teamSprites/ANA.bmp"),
	1 : preload("res://Sprites/teamSprites/BOS.bmp"),
	2 : preload("res://Sprites/teamSprites/BUF.bmp"),
	3 : preload("res://Sprites/teamSprites/CAR.bmp"),
	4 : preload("res://Sprites/teamSprites/CBJ.bmp"),
	5 : preload("res://Sprites/teamSprites/CGY.bmp"),
	6 : preload("res://Sprites/teamSprites/CHI.bmp"),
	7 : preload("res://Sprites/teamSprites/COL.bmp"),
	8 : preload("res://Sprites/teamSprites/DAL.bmp"),
	9 : preload("res://Sprites/teamSprites/DET.bmp"),
	10 : preload("res://Sprites/teamSprites/EDM.bmp"),
	11 : preload("res://Sprites/teamSprites/FLA.bmp"),
	12 : preload("res://Sprites/teamSprites/LAK.bmp"),
	13 : preload("res://Sprites/teamSprites/MIN.bmp"),
	14 : preload("res://Sprites/teamSprites/MTL.bmp"),
	15 : preload("res://Sprites/teamSprites/NJD.bmp"),
	16 : preload("res://Sprites/teamSprites/NSH.bmp"),
	17 : preload("res://Sprites/teamSprites/NYI.bmp"),
	18 : preload("res://Sprites/teamSprites/NYR.bmp"),
	19 : preload("res://Sprites/teamSprites/OTT.bmp"),
	20 : preload("res://Sprites/teamSprites/PHI.bmp"),
	21 : preload("res://Sprites/teamSprites/PIT.bmp"),
	22 : preload("res://Sprites/teamSprites/SEA.bmp"),
	23 : preload("res://Sprites/teamSprites/SJS.bmp"),
	24 : preload("res://Sprites/teamSprites/STL.bmp"),
	25 : preload("res://Sprites/teamSprites/TBL.bmp"),
	26 : preload("res://Sprites/teamSprites/TOR.bmp"),
	27 : preload("res://Sprites/teamSprites/UTA.bmp"),
	28 : preload("res://Sprites/teamSprites/VAN.bmp"),
	29 : preload("res://Sprites/teamSprites/VGK.bmp"),
	30 : preload("res://Sprites/teamSprites/WPG.bmp"),
	31 : preload("res://Sprites/teamSprites/WSH.bmp"),
}

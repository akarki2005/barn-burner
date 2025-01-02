extends Node2D


func _ready():
	modulate.a = 0.75
	
	if GameVariables.game_mode_is_chaos:
		$CreaseLeft.frame = 1
		$CreaseRight.frame = 1
	else:
		$CreaseLeft.frame = 0
		$CreaseRight.frame = 0

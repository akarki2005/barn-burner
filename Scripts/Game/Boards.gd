extends Node2D

const classic_scale_y = 7
const chaos_scale_y = 3.5

const top_left_classic_pos = Vector2(-569, -175) 
const bottom_left_classic_pos = Vector2(-569, 175)
const top_right_classic_pos = Vector2(569, -175)
const bottom_right_classic_pos = Vector2(569, 175)

const top_left_chaos_pos = Vector2(-569, -210) 
const bottom_left_chaos_pos = Vector2(-569, 210)
const top_right_chaos_pos = Vector2(569, -210)
const bottom_right_chaos_pos = Vector2(569, 210)

func _ready():
	if GameVariables.game_mode_is_chaos:
		$LeftTop.position = top_left_chaos_pos
		$LeftTop.scale.y = chaos_scale_y
		$LeftBottom.position = bottom_left_chaos_pos
		$LeftBottom.scale.y = chaos_scale_y
		$RightTop.position = top_right_chaos_pos
		$RightTop.scale.y = chaos_scale_y
		$RightBottom.position = bottom_right_chaos_pos
		$RightBottom.scale.y = chaos_scale_y
	else:
		$LeftTop.position = top_left_classic_pos
		$LeftTop.scale.y = classic_scale_y
		$LeftBottom.position = bottom_left_classic_pos
		$LeftBottom.scale.y = classic_scale_y
		$RightTop.position = top_right_classic_pos
		$RightTop.scale.y = classic_scale_y
		$RightBottom.position = bottom_right_classic_pos
		$RightBottom.scale.y = classic_scale_y

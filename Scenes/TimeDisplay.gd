extends Label

var counter = 0
var overtime = 1
var end_of_regulation = false
var gameover = false

func _physics_process(delta):
	counter += 1
	var time = $GameClock.time_left
	if time > 0:
		var mins = int(time) / 60
		var secs = int(time) % 60
		if secs < 10:
			text = "%s:0%s" % [mins, secs]
		else:
			text = "%s:%s" % [mins, secs]
	elif end_of_regulation and counter % 60 == 0 and not gameover:
		var otmins = overtime / 60
		var otsecs = overtime % 60
		if otsecs < 10:
			text = "+%s:0%s" % [otmins, otsecs]
		else:
			text = "+%s:%s" % [otmins, otsecs]
		overtime += 1
		counter = 0


func _on_game_clock_timeout():
	await get_tree().create_timer(6.0, false).timeout
	end_of_regulation = true
	if GameVariables.p1_score != GameVariables.p2_score:
		gameover = true
	counter = 0


func _on_goal_scored():
	gameover = end_of_regulation

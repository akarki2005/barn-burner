extends Control

func _on_goal_detector_left_body_entered(body):
	var goallightp2 = $GoalLightP2
	var timedisplay = $TimeDisplay
	var p2score = $P2Score
	var timer = $TimeDisplay/GameClock
	var goalalert = $GoalAlert
	var goalalertlabel = $GoalAlertP2Label
	
	goallightp2._on_goal_scored()
	timedisplay._on_goal_scored()
	p2score._increment()
	timer._on_goal_scored()
	goalalert._on_goal_scored('p2')
	goalalertlabel._on_goal_scored()


func _on_goal_detector_right_body_entered(body):
	var goallightp1 = $GoalLightP1
	var timedisplay = $TimeDisplay
	var p1score = $P1Score
	var timer = $TimeDisplay/GameClock
	var goalalert = $GoalAlert
	var goalalertlabel = $GoalAlertP1Label
	
	goallightp1._on_goal_scored()
	timedisplay._on_goal_scored()
	p1score._increment()
	timer._on_goal_scored()
	goalalert._on_goal_scored('p1')
	goalalertlabel._on_goal_scored()

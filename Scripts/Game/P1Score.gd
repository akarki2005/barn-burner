extends Label

var score = 0

func _increment():
	score += 1
	text = "%s" % score

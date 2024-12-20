extends Timer

func _ready():
	await get_tree().create_timer(3.0, false).timeout
	start()


func _on_goal_scored():
	paused = true
	await get_tree().create_timer(6.0, false).timeout
	paused = false

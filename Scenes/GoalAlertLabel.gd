extends Label

func _ready():
	visible = false


func _on_goal_scored():
	visible = true
	await get_tree().create_timer(3.0, false).timeout
	visible = false


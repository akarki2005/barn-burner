extends AnimatedSprite2D

func _ready():
	play("light_off")


func _on_goal_scored():
	play("light_on")
	await get_tree().create_timer(3.0).timeout
	stop()
	play("light_off")

extends Timer

func _ready():
	await get_tree().create_timer(4.0).timeout
	print('starting')
	start()
	print(time_left)

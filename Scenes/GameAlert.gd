extends Sprite2D

var dormantpos = Vector2(100, -40)
var activepos = Vector2(576, 106)

func _ready():
	position = dormantpos

func _alert(event):
	if event == 'faceoff' or event == 'end_of_reg':
		position = activepos
		await get_tree().create_timer(3.0).timeout
		position = dormantpos
	elif event == 'gameover_ot':
		await get_tree().create_timer(3.0).timeout
		position = activepos
	elif event == 'gameover_reg':
		position = activepos

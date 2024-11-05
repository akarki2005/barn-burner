extends Label

func _ready():
	visible = false

func _alert(event):
	# precondition: any(event == x for x in ['gameover_reg', 'end_of_reg', 'gameover_ot', 'faceoff'])
	if event == 'faceoff':
		visible = true
		text = 'FACEOFF IN 3'
		for i in range(3):
			text = 'FACEOFF IN %s' % (3 - i)
			await get_tree().create_timer(0.99, false).timeout
		visible = false
	elif event == 'gameover_reg':
		visible = true
		text = 'FINAL'
	elif event == 'end_of_reg':
		visible = true
		text = 'END OF REG.'
		await get_tree().create_timer(3.0, false).timeout
		visible = false
	else:
		await get_tree().create_timer(3.0, false).timeout
		visible = true
		text = 'FINAL - OT'

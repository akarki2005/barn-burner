extends Label

func hover_color(color):
	# precondition: color == 'blue' or color == 'black'
	if color == 'blue':
		set("theme_override_colors/font_color", Color.BLUE)
	else:
		set("theme_override_colors/font_color", Color.BLACK)

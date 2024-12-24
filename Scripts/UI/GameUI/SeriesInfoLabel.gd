extends Label

func _ready():
	update()


func update():
	if SeriesVariables.series_length != 1:
		text = SeriesInfoDisplay.get_best_of() + " - " + SeriesInfoDisplay.get_info()
	else: 
		text = "Exhibition"

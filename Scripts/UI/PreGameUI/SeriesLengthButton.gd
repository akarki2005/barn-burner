extends OptionButton

func _ready():
	SeriesVariables.series_length = 1
	selected = 0


func _on_item_selected(index):
	SeriesVariables.series_length = 1 + 2 * index

extends OptionButton


func _on_item_selected(index):
	SeriesVariables.series_length = 1 + 2 * index

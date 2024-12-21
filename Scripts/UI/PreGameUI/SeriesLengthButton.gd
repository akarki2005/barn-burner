extends OptionButton

func _ready():
	selected = SeriesVariables.series_length / 2


func _on_item_selected(index):
	SeriesVariables.series_length = 1 + 2 * index

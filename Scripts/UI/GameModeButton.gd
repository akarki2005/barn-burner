extends OptionButton


func _on_item_selected(index):
	GameVariables.game_mode_is_chaos = bool(index)


func _ready():
	GameVariables.game_mode_is_chaos = false

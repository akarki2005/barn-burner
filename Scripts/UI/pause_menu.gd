extends Control

@onready var resume_button = $Panel/VBoxContainer/ResumeButton
@onready var quit_button = $Panel/VBoxContainer/QuitButton

func _ready():
	visible = false
	resume_button.pressed.connect(_pause)
	quit_button.pressed.connect(_quit)


func _physics_process(_delta):
	# unpause game
	if Input.is_action_just_pressed('pause'):
		_pause()


func _pause():
	if not visible:
		visible = true
		get_tree().paused = true
	else:
		visible = false
		get_tree().paused = false


func _quit():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/MainScenes/title_screen.tscn")


func _on_quit_button_pressed():
	GameFunctions.reset_series_variables()

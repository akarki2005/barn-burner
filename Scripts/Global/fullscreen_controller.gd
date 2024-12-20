extends Node


func _ready():
	# set the process mode to always
	process_mode = Node.PROCESS_MODE_ALWAYS


func _physics_process(_delta):
	if Input.is_action_just_pressed('toggle_fullscreen'):
		GameFunctions.toggle_fullscreen_mode()

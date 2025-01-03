extends CharacterBody2D

# used to differentiate between player 1 and 2 controls
@export var move_left = ''
@export var move_right = ''
@export var move_up = ''
@export var move_down = ''
@export var boost = ''

@onready var teamSprite = $teamSprite
var curr_sprite_index = 0

var speed = 300
var boost_speed = 450
var impulse = 400

var p1holding_pos = Vector2(100, -300)
var p2holding_pos = Vector2(200, -300)

var g1holding_pos = Vector2(100, -500)
var g2holding_pos = Vector2(200, -500)

var p1score = 0
var p2score = 0

var gameover = false
var ot = false
var teams = 32

var frozen = true

var curr_boost = 0
const max_boost = 120.0
var lock_boost = false
var boost_counter = 60
var prev_boosting = false

var boost_meter_frames = 64

var goalie: bool = false

func _ready():
	
	curr_boost = max_boost
	# set sprite of players
	if self.move_up == 'upp1':
		if GameVariables.home_team == 2:
			teamSprite.texture = load("res://Sprites/teamSprites/pushers_away.bmp")
			teamSprite.frame = GameVariables.p1_team_number % teams
		else:
			teamSprite.texture = load("res://Sprites/teamSprites/pushers_home.bmp")
			teamSprite.frame = GameVariables.p1_team_number % teams
	else:
		if GameVariables.home_team == 2:
			teamSprite.texture = load("res://Sprites/teamSprites/pushers_home.bmp")
			teamSprite.frame = GameVariables.p2_team_number % teams
		else:
			teamSprite.texture = load("res://Sprites/teamSprites/pushers_away.bmp")
			teamSprite.frame = GameVariables.p2_team_number % teams
	
	await get_tree().create_timer(3.0, false).timeout
	frozen = false

# player movement
func get_input():
	if not frozen:
		var direction = Input.get_vector(move_left, move_right, move_up, move_down)
		velocity = calculate_velocity(direction)
	# game paused, faceoff countdown etc.
	else:
		velocity = Vector2.ZERO
	
	
func calculate_velocity(direction):
	if boosting():
		return direction * boost_speed
	else:
		return direction * speed
	

func boosting():
	# return whether the booster is currently boosting
	var a = Input.is_action_pressed(boost)
	var b = curr_boost > 0
	var c = not lock_boost
	return a and b and c


func boost_calculations():
	# deplete boost
	if boosting() and velocity != Vector2.ZERO:
		curr_boost -= 1
		prev_boosting = true
	# freeze boost
	elif prev_boosting and not lock_boost:
		boost_counter = 0
		prev_boosting = false
	# lock boost
	elif curr_boost == 0 and not lock_boost:
		lock_boost = true
		boost_counter = 0
		prev_boosting = false
	# regenerate boost
	elif boost_counter >= 60:
		curr_boost += 0.5
		prev_boosting = false
	curr_boost = clamp(curr_boost, 0, max_boost)
	
	if curr_boost == max_boost:
		lock_boost = false

	boost_counter += 1
	boost_counter = clamp(boost_counter, 0, 60)


func _physics_process(delta):
	get_input()
	boost_calculations()
	var collision = move_and_collide(delta * velocity)
	
	# handles player collision with puck
	if collision:
		if collision.get_collider() is RigidBody2D:
			collision.get_collider().apply_central_impulse(impulse * -collision.get_normal())
		
			
func reset():

	curr_boost = max_boost
	
	if move_up == 'upp1':
		if not goalie:
			position = p1holding_pos
			velocity = Vector2.ZERO
			await get_tree().create_timer(0.01, false).timeout
			position = GameVariables.p1initial_pos
		else:
			position = g1holding_pos
			velocity = Vector2.ZERO
			await get_tree().create_timer(0.01, false).timeout
			position = GameVariables.g1initial_pos
	else:
		if not goalie:
			position = p2holding_pos
			velocity = Vector2.ZERO
			await get_tree().create_timer(0.01, false).timeout
			position = GameVariables.p2initial_pos
		else:
			position = g2holding_pos
			velocity = Vector2.ZERO
			await get_tree().create_timer(0.01, false).timeout
			position = GameVariables.g2initial_pos


func _end_of_regulation():
	if p1score == p2score:
		frozen = true
		await get_tree().create_timer(3.0, false).timeout
		reset()
		await get_tree().create_timer(3.0, false).timeout
		frozen = false
		ot = true
	else:
		frozen = true
		gameover = true


func _on_goal_detector_left_body_entered(body):
	_on_goal_detector_entered(body, "left")


func _on_goal_detector_right_body_entered(body):
	_on_goal_detector_entered(body, "right")


func _on_goal_detector_entered(body, side):
	# precondition: side == "left" or side == "right"
	if ot:
		gameover = true
	if body is RigidBody2D:
		if side == "left":
			p2score += 1
		else:
			p1score += 1
		frozen = true
		await get_tree().create_timer(3.0, false).timeout
		if not gameover:
			reset()
			await get_tree().create_timer(3.0, false).timeout
			frozen = false

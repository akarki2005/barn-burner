extends CharacterBody2D

# used to differentiate between player 1 and 2 controls
@export var move_left = ''
@export var move_right = ''
@export var move_up = ''
@export var move_down = ''

var speed = 300
var impulse = 400

var p1initial_pos = Vector2(300, 359)
var p2initial_pos = Vector2(852, 359)

var p1score = 0
var p2score = 0

var gameover = false
var ot = false

var frozen = true

func _ready():
	await get_tree().create_timer(3.0).timeout
	frozen = false

func get_input():
	if not frozen:
		var direction = Input.get_vector(move_left, move_right, move_up, move_down)
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
	
func _physics_process(delta):
	get_input()
	var collision = move_and_collide(delta * velocity)
	
	# handles player collision with puck
	if collision:
		if collision.get_collider() is RigidBody2D:
			collision.get_collider().apply_central_impulse(impulse * -collision.get_normal())
			
			
func reset():
	if not gameover:
		if self.move_left == 'leftp1':
			self.position = p1initial_pos
			velocity = Vector2.ZERO
		else:
			self.position = p2initial_pos
			velocity = Vector2.ZERO


func _end_of_regulation():
	if p1score == p2score:
		frozen = true
		await get_tree().create_timer(3.0).timeout
		reset()
		await get_tree().create_timer(3.0).timeout
		frozen = false
		ot = true
	else:
		frozen = true
		gameover = true


func _on_goal_detector_left_body_entered(body):
	if ot:
		gameover = true
	if body is RigidBody2D:
		p2score += 1
		frozen = true
		await get_tree().create_timer(3.0).timeout
		if not gameover:
			reset()
			await get_tree().create_timer(3.0).timeout
			frozen = false


func _on_goal_detector_right_body_entered(body):
	if ot:
		gameover = true
	if body is RigidBody2D:
		p1score += 1
		frozen = true
		await get_tree().create_timer(3.0).timeout
		if not gameover:
			reset()
			await get_tree().create_timer(3.0).timeout
			frozen = false

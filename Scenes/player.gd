extends CharacterBody2D

# used to differentiate between player 1 and 2 controls
@export var move_left = ''
@export var move_right = ''
@export var move_up = ''
@export var move_down = ''

@onready var teamSprite = $teamSprite
var curr_sprite_index = 0

const teamSpritesheet = {
	0 : preload("res://Sprites/teamSprites/ANA.bmp"),
	1 : preload("res://Sprites/teamSprites/BOS.bmp"),
	2 : preload("res://Sprites/teamSprites/BUF.bmp"),
	3 : preload("res://Sprites/teamSprites/CAR.bmp"),
	4 : preload("res://Sprites/teamSprites/CBJ.bmp"),
	5 : preload("res://Sprites/teamSprites/CGY.bmp"),
	6 : preload("res://Sprites/teamSprites/CHI.bmp"),
	7 : preload("res://Sprites/teamSprites/COL.bmp"),
	8 : preload("res://Sprites/teamSprites/DAL.bmp"),
	9 : preload("res://Sprites/teamSprites/DET.bmp"),
	10 : preload("res://Sprites/teamSprites/EDM.bmp"),
	11 : preload("res://Sprites/teamSprites/FLA.bmp"),
	12 : preload("res://Sprites/teamSprites/LAK.bmp"),
	13 : preload("res://Sprites/teamSprites/MIN.bmp"),
	14 : preload("res://Sprites/teamSprites/MTL.bmp"),
	15 : preload("res://Sprites/teamSprites/NJD.bmp"),
	16 : preload("res://Sprites/teamSprites/NSH.bmp"),
	17 : preload("res://Sprites/teamSprites/NYI.bmp"),
	18 : preload("res://Sprites/teamSprites/NYR.bmp"),
	19 : preload("res://Sprites/teamSprites/OTT.bmp"),
	20 : preload("res://Sprites/teamSprites/PHI.bmp"),
	21 : preload("res://Sprites/teamSprites/PIT.bmp"),
	22 : preload("res://Sprites/teamSprites/SEA.bmp"),
	23 : preload("res://Sprites/teamSprites/SJS.bmp"),
	24 : preload("res://Sprites/teamSprites/STL.bmp"),
	25 : preload("res://Sprites/teamSprites/TBL.bmp"),
	26 : preload("res://Sprites/teamSprites/TOR.bmp"),
	27 : preload("res://Sprites/teamSprites/UTA.bmp"),
	28 : preload("res://Sprites/teamSprites/VAN.bmp"),
	29 : preload("res://Sprites/teamSprites/VGK.bmp"),
	30 : preload("res://Sprites/teamSprites/WPG.bmp"),
	31 : preload("res://Sprites/teamSprites/WSH.bmp"),
}

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
	# set sprite of players
	if self.move_left == 'leftp1':
		teamSprite.texture = GameVariables.globalTeamSpritesheet[GameVariables.p1_team_number]
	else:
		teamSprite.texture = GameVariables.globalTeamSpritesheet[GameVariables.p2_team_number]
	teamSprite.scale = Vector2(1.2, 1.2)
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

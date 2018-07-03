extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const SPEED = 100
const JUMPHEIGHT = -550

var motion = Vector2()

var timeToMoveFor = 2
var timeToMoveCounter = 0

func _ready():
	add_to_group("enemies")

func _physics_process(delta):
	timeToMoveCounter += delta
	if (timeToMoveCounter > timeToMoveFor):
		$AnimatedSprite.play("Move")
		var randomNumber = randi()%2+1
		#print(randomNumber)
		timeToMoveCounter = 0
		if (randomNumber == 1):
			motion.x = SPEED * -1
			$AnimatedSprite.flip_h = false
		else:
			motion.x = SPEED * 1
			$AnimatedSprite.flip_h = true
	motion.y += GRAVITY
	motion = move_and_slide(motion) 
	
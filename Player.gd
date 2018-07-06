extends KinematicBody2D
const UP = Vector2(0,-1)
const GRAVITY = 20
const SPEED = 500
const JUMPHEIGHT = -550

var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		motion.x = 0
		$Sprite.play("Idle")
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMPHEIGHT
			$Sprite.play("Jump")
	if is_on_floor():
		if Input.is_action_pressed("ui_x"):
			motion.y = JUMPHEIGHT * 2
			$Sprite.play("Jump")
	else:
		$Sprite.play("Jump")
	motion = move_and_slide(motion, UP)
	if Input.is_action_pressed("ui_down"):
		motion.y += GRAVITY * 1.5
		$Sprite.play("Slide")
		

func _on_PlayerBody_body_entered(body):
	if body.is_in_group("enemies"):
		get_tree().change_scene("res://World.tscn")
	else:
		pass
	
	
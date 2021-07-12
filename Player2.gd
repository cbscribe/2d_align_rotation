extends KinematicBody2D

export var speed = 750
export var jump_speed = -1450
export var gravity = 4000
export (float, 0, 1.0) var friction = 0.2
export (float, 0, 1.0) var acceleration = 0.6

var velocity = Vector2.ZERO  # local
var is_jumping = false
var snap = Vector2.ZERO

	
func get_input():
	var dir = 0
	if Input.is_action_pressed("ui_right"):
		dir += 1
	if Input.is_action_pressed("ui_left"):
		dir -= 1
	velocity.x = 0
	if dir != 0:
		velocity.x = dir * speed
		$AnimatedSprite.scale.x = sign(dir) * 2
		$AnimatedSprite.play("default")
	else:
		$AnimatedSprite.stop()
		$AnimatedSprite.frame = 0
	return dir != 0
	
	
func _physics_process(delta):
	var is_input = get_input()
	velocity.y += gravity * delta
	snap = transform.y * 128 if !is_jumping else Vector2.ZERO
	velocity = move_and_slide_with_snap(velocity.rotated(rotation),
			snap, -transform.y, true, 4, PI/3)
	velocity = velocity.rotated(-rotation)
	if is_on_floor():
		rotation = get_floor_normal().angle() + PI/2
#		if get_floor_normal().dot(Vector2.UP) < 0.9 and !is_input:
#			velocity = Vector2.ZERO
		is_jumping = false
		if Input.is_action_just_pressed("ui_up"):
			is_jumping = true
			velocity.y = jump_speed
	else:
		var c = head_is_colliding()
		if c:
			velocity = Vector2.ZERO
			rotation = c.get_collision_normal().angle() + PI/2
	if is_on_wall() and is_jumping and is_input:
#	if is_on_floor() and is_on_wall() and is_input:
		if $WallRight.is_colliding():
			rotation = $WallRight.get_collision_normal().angle() + PI/2
		if $WallLeft.is_colliding():
			rotation = $WallLeft.get_collision_normal().angle() + PI/2
			
func head_is_colliding():
	if $UpLeft.is_colliding():
		return $UpLeft
	elif $UpRight.is_colliding():
		return $UpRight
	return null

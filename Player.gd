extends KinematicBody2D

export var speed = 750
export var jump_speed = -1450
export var gravity = 4000
export (float, 0, 1.0) var friction = 0.2
export (float, 0, 1.0) var acceleration = 0.6

export var foo = 0.0001

var velocity = Vector2.ZERO  # In *local* coords.
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
		$AnimatedSprite.scale.x = sign(dir) * 2
		velocity.x = dir * speed
#		velocity.x = lerp(velocity.x, dir * speed, acceleration)
		$AnimatedSprite.play("default")
	else:
#		velocity.x = lerp(velocity.x, 0, friction)
		$AnimatedSprite.stop()
		$AnimatedSprite.frame = 0


func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	# 1
#	velocity = move_and_slide(velocity, Vector2.UP, true)
#	velocity = move_and_slide(velocity.rotated(rotation), -transform.y, true)
#	velocity = velocity.rotated(-rotation)
	# 2
	snap = transform.y * 128 if !is_jumping else Vector2.ZERO
#	velocity = move_and_slide_with_snap(velocity, snap, Vector2.UP, true)
	# 3 transform.basis_xform(velocity)
	velocity = move_and_slide_with_snap(velocity.rotated(rotation),
			snap, -transform.y, true, 4, PI/3)
	velocity = velocity.rotated(-rotation)
#	velocity = transform.basis_xform_inv(velocity)
	
	if is_on_floor():
		rotation = get_floor_normal().angle() + PI/2
		is_jumping = false
		if Input.is_action_just_pressed("ui_up"):
			is_jumping = true
			velocity.y = jump_speed


extends Node2D

var target
var active = false


func _on_Body_body_entered(body):
	pass # Replace with function body.


func _on_Detect_body_entered(body):
	print("detected ", body.name)
	target = body
	if !active:
		$Body/AnimationPlayer.play("move")
	active = true


func _on_Detect_body_exited(body):
	print("lost")
	target = null
	yield(get_tree().create_timer(1.5), "timeout")
	if !target:
		$Body/AnimationPlayer.play_backwards("move")
		active = false

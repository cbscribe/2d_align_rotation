extends TextureRect

	
#func shockwave(pos, speed):
#	$Sprite.position = pos
#	$Sprite.scale = Vector2(0, 0)
#	$Sprite.show()
#	$Tween.interpolate_property($Sprite, "scale", null, Vector2(2, 2), speed,
#			Tween.TRANS_QUINT, Tween.EASE_IN)
#	$Tween.start()
#	yield($Tween, "tween_all_completed")
#	$Sprite.hide()
	
func shockwave(pos, speed):
	var s = $Sprite.duplicate()
	add_child(s)
	s.position = pos
	s.scale = Vector2(0, 0)
	s.show()
	$Tween.interpolate_property(s, "scale", null, Vector2(2, 2), speed,
			Tween.TRANS_QUAD, Tween.EASE_IN)
	$Tween.start()
	yield($Tween, "tween_all_completed")
	s.queue_free()

	
#func _gui_input(event):
#	if event is InputEventMouseButton and event.pressed:
#		if event.button_index == BUTTON_LEFT:
#			shockwave2(event.position, 1)

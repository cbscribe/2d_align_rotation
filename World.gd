extends Node2D


func _physics_process(delta):
#	$Camera2D.position = lerp($Camera2D.position, $Player2.position, 0.05)
#	$Camera2D.position = $Player2.position
#	$Camera2D.rotation = lerp_angle($Camera2D.rotation, $Player2.rotation, 0.05)
	$Camera2D.transform = $Camera2D.transform.interpolate_with($Player2.transform, 0.05)

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT:
			$CanvasLayer/EffectsLayer.shockwave(event.position, 1.75)

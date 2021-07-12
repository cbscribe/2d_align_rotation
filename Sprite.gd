extends Sprite

var target
var rel

func _process(delta):
	if target:
		rel = get_local_mouse_position() - target
	update()

func _input(event):
	if event is InputEventMouseMotion:
		print(event.speed)
	if event is InputEventMouseButton:
		if event.pressed:
			target = get_local_mouse_position()
		else:
			target = null
		
func _draw():
	if target:
		draw_arc(rel, 40, 0, 2*PI, 300, Color(1, 0, 0), 5)
		draw_line(Vector2.ZERO, rel, Color(1, 1, 0), 5)

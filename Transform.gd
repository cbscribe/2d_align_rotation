extends Node2D

func _draw():
	draw_arrow(Vector2.RIGHT * 64, Vector2(), 1, Color(1.0, .329, .298))
	draw_arrow(Vector2.DOWN * 64, Vector2(), 1, Color(.054, .718, .247))

func draw_arrow(vector, pos, scale, color):
	if vector.length_squared() < 25:
		return
	draw_line(pos * scale, vector * scale, color, 12)
	var dir = vector.normalized()
	draw_triangle(vector * scale, dir, 10, color)
	draw_circle(pos, 5, color)

func draw_triangle(pos, dir, size, color):
	var a = pos + dir * size
	var b = pos + dir.rotated(2*PI/3) * size
	var c = pos + dir.rotated(4*PI/3) * size
	var points = PoolVector2Array([a, b, c])
	draw_polygon(points, PoolColorArray([color]))

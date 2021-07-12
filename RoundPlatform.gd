extends StaticBody2D

export (Color) var outer = Color(.4, .74, .22)
export (Color) var inner = Color(.4, .74, .22)

func _draw():
	draw_circle(Vector2.ZERO, $CollisionShape2D2.shape.radius, outer)
	draw_circle(Vector2.ZERO, $CollisionShape2D2.shape.radius-25, inner)

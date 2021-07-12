extends StaticBody2D

export (Color) var outer = Color(.4, .74, .22)
export (Color) var inner = Color(.4, .74, .22)

func _draw():
	draw_polygon($CollisionPolygon2D.polygon, PoolColorArray([outer]))
	draw_set_transform(Vector2.ZERO, 0, Vector2(0.8, 0.8))	
	draw_polygon($CollisionPolygon2D.polygon, PoolColorArray([inner]))

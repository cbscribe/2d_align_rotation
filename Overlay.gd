extends Node2D

var font = load("res://font_roboto_16.tres")

func _process(delta):
	update()
	

func _draw():
	draw_string(font, Vector2(20, 20), "on_floor: " + str(get_node("../../Player2").is_on_floor()), Color(1, 1, 1))
#	draw_string(font, Vector2(20, 50), str(get_node("../../Player2").velocity), Color(1, 1, 1))
	draw_string(font, Vector2(20, 50), "is_jump: " + str(get_node("../../Player2").is_jumping), Color(1, 1, 1))
	

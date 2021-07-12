extends Control

func _ready():
	randomize()
	var toughness = 1
	for i in 10:
		toughness = randi() % (toughness + 3) + (toughness - 3)
		print(toughness)

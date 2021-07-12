extends Node2D

func _ready():
	$Tween.interpolate_property($ColorRect, "material:shader_param/radius", 0, 0.8, 0.5,
			Tween.TRANS_EXPO, Tween.EASE_IN)
	$Tween.start()
	
#var complete_dict = {}
#
#func _ready():
#	load_data()
#
#func load_data():
#	var file = File.new()
#	if file.file_exists("user://save.txt"):
#		file.open("user://save.txt", File.READ)
#		var data = file.get_var()
#		print(data)
#		complete_dict = data.complete_dict
#		print(complete_dict)
#
#func save_data():
#	var data = {
#		complete_dict = complete_dict
#	}
#	var file = File.new()
#	file.open("user://save.txt", File.WRITE)
#	file.store_var(data)
#	file.close()

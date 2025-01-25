extends Sprite2D


func _on_button_pressed() -> void:
	print("play button pressed")
	get_tree().change_scene_to_file("res://Scenes/MainScene.tscn")

extends Sprite2D


func _on_button_pressed() -> void:
	EffectsPlayer.stream = load("res://Audio/UI Sounds/button press 5.wav")
	EffectsPlayer.play()
	get_tree().change_scene_to_file("res://Scenes/MainScene.tscn")
	

extends Sprite2D

func _on_exit_button_pressed() -> void:
	EffectsPlayer.stream = load("res://Audio/UI Sounds/button press 4.wav")
	EffectsPlayer.play()
	get_tree().paused = false
	hide()




func _on_how_to_playbutton_pressed() -> void:
	EffectsPlayer.stream = load("res://Audio/UI Sounds/button press 5.wav")
	EffectsPlayer.play()
	get_tree().paused = true
	show()

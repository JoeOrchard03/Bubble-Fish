extends Sprite2D

func _on_exit_button_pressed() -> void:
	get_tree().paused = false
	hide()
	pass # Replace with function body.


func _on_how_to_playbutton_pressed() -> void:
	get_tree().paused = true
	show()
	print("How to play pressed")

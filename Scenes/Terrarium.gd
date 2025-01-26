extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_touch_screen_button_pressed() -> void:
	get_tree().paused = true
	show()
	print("Bubble pressed")


func _on_exit_button_pressed() -> void:
	get_tree().paused = false
	hide()
	pass # Replace with function body.

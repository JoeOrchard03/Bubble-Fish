extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_touch_screen_button_pressed() -> void:
	EffectsPlayer.stream = load("res://Audio/UI Sounds/button press 5.wav")
	EffectsPlayer.play()
	get_tree().paused = true
	show()
	print("Bubble pressed")


func _on_exit_button_pressed() -> void:
	EffectsPlayer.stream = load("res://Audio/UI Sounds/button press 4.wav")
	EffectsPlayer.play()
	get_tree().paused = false
	hide()
	pass # Replace with function body.


func _on_compendium_button_pressed() -> void:
	EffectsPlayer.stream = load("res://Audio/UI Sounds/button press 5.wav")
	EffectsPlayer.play()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Compendium.tscn")


func _on_compendium_button_2_pressed() -> void:
	EffectsPlayer.stream = load("res://Audio/UI Sounds/button press 5.wav")
	EffectsPlayer.play()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/shop_root_node.tscn")

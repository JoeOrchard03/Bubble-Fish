extends Sprite2D




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$BubbleCountUi.text = str(PlayerInfo.current_bubbles) + "/9"


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventScreenTouch and event.is_pressed():
		if PlayerInfo.current_bubbles >= 9:
			get_tree().change_scene_to_file("res://Scenes/scratch_card_scene.tscn")

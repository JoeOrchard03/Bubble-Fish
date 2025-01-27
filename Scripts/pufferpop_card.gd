extends Sprite2D

var handled:bool = false

func _ready() -> void:
	PlayerInfo.pufferpop_button_ref = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	handled = false
	$BubbleCountUi.text = str(PlayerInfo.current_bubbles) + "/9"


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventScreenTouch and event.is_pressed():
		handled = true
		if PlayerInfo.current_bubbles >= 9:
			EffectsPlayer.stream = load("res://Audio/UI Sounds/button press 5.wav")
			EffectsPlayer.play()
			get_tree().change_scene_to_file("res://Scenes/scratch_card_scene.tscn")

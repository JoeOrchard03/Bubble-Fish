extends Sprite2D

var dad:Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dad = get_tree().root.get_node("MainSceneRoot/ControlLogic")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	dad.ship_pos = $BoatOffsetPos.global_position

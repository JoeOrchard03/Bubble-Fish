extends Sprite2D

@export var minExistenceTime = 2.5
@export var maxExistenceTime = 5
var currentCounter = 0

var dad

func _ready():
	# Start the timer when the scene or node is ready
	var delay = randf_range(minExistenceTime, maxExistenceTime)
	$DeleteTimer.start(delay)

func _on_delete_timer_timeout() -> void:
	dad.suicide(global_position)
	queue_free()  # Deletes the current node


func _on_area_2d_area_entered(area: Area2D) -> void:
	var bubbleCounter = get_tree().root.get_node("MainSceneRoot/BubbleCounter")
	bubbleCounter.counter = bubbleCounter.counter + 1
	bubbleCounter.label.text = "You have: " + str(bubbleCounter.counter) + " bubbles"
	dad.suicide(global_position)
	queue_free()
	print("Bubble hit")

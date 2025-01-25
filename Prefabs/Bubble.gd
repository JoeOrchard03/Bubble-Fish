extends Sprite2D

@export var minExistenceTime = 2.5
@export var maxExistenceTime = 5

var dad

func _ready():
	# Start the timer when the scene or node is ready
	print("Trying to start timer")
	var delay = randf_range(minExistenceTime, maxExistenceTime)
	$DeleteTimer.start(delay)

func _on_delete_timer_timeout() -> void:
	print("Trying to delete")
	dad.suicide(global_position)
	queue_free()  # Deletes the current node

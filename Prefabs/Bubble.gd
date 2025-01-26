extends Sprite2D

@export var minExistenceTime = 2.5
@export var maxExistenceTime = 5
var currentCounter = 0

var target_position

var speed = 0.5
var speed_variance = 0.15

var dad

func _physics_process(delta: float) -> void:
	if position.y <= -500:
		dad.Spawn()
		queue_free()
	else:
		position = position.lerp(target_position, randf_range(speed-speed_variance, speed+speed_variance) * delta)

func _ready():
	var x_offset = randf_range(-700, 700)
	target_position = Vector2(global_position.x+x_offset, -600)
	$AnimationPlayer.speed_scale = randf_range(1, 2.5)
	
	

func _on_delete_timer_timeout() -> void:
	dad.suicide(global_position)
	queue_free()  # Deletes the current node


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "net":
		var bubbleCounter = get_tree().root.get_node("MainSceneRoot/BubbleCounter")
		bubbleCounter.counter = bubbleCounter.counter + 1
		bubbleCounter.label.text = "You have: " + str(bubbleCounter.counter) + " bubbles"
		dad.suicide(global_position)
		queue_free()
		print("Bubble hit")

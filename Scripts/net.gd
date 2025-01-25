extends RigidBody2D

var dad

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = Timer.new()
	add_child(timer)
	timer.one_shot = true
	timer.start(2)
	timer.connect("timeout", out_of_time)

func out_of_time():
	dad.net_active = false
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

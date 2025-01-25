extends Node2D

var net_prefab = preload("res://Prefabs/net.tscn")

var start_pos: Vector2 = Vector2(-1, -1)
var final_pos: Vector2

var launch_direction:Vector2
var launch_force:float

var is_held:bool = false

var once:bool = false

var twice:bool = false

var pressed:bool = false

func launch():
	if !once:
		launch_direction = (start_pos-final_pos).normalized()
		launch_force = start_pos.distance_to(final_pos)
		print("-------Launch-------")
		print("Direction:")
		print(launch_direction)
		print("Force:")
		print(launch_force)
		print("Start:")
		print(start_pos)
		print("Final:")
		print(final_pos)
		
		var net = net_prefab.instantiate()
		add_child(net)
		net.position = Vector2(1280, 1212)
		
		net.apply_central_impulse(launch_direction*(launch_force*1.7))
		
		start_pos = Vector2(-1, -1)
		once = true
		twice = false

func _physics_process(delta: float) -> void:
	if twice:
		launch()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		pressed = event.pressed
		if !pressed:
			twice = true
		else:
			once = false
	if event is InputEventScreenDrag or event is InputEventScreenTouch:
		if start_pos == Vector2(-1, -1):
			start_pos = event.position
		final_pos = event.position
			

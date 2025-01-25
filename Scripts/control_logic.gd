extends Node2D

var net_prefab = preload("res://Prefabs/net.tscn")

var line:Line2D

@export var ship_pos = Vector2(1280, 1212)

var start_pos: Vector2 = Vector2(-1, -1)
var final_pos: Vector2

var launch_direction:Vector2
var launch_force:float

var is_held:bool = false

var once:bool = false

var twice:bool = false

var pressed:bool = false

var net_active = false

func launch():
	if !once:
		if !net_active:
			
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
			net.name = "net"
			add_child(net)
			net.dad = self
			net_active = true
			net.position = ship_pos
			
			net.apply_central_impulse(launch_direction*(launch_force*1.7))
			
			start_pos = Vector2(-1, -1)
		once = true
		twice = false

func _physics_process(delta: float) -> void:
	
	
	if line != null:
		line.queue_free()
	if pressed:
		line = Line2D.new()
		add_child(line)
		line.position = ship_pos
		line.add_point(Vector2(0, 0))
		var curve = Curve.new()
		curve.add_point(Vector2(0.2, 0.2))
		curve.add_point(Vector2(1, 1))
		line.antialiased = true
		line.end_cap_mode = Line2D.LINE_CAP_ROUND
		line.begin_cap_mode = Line2D.LINE_CAP_ROUND
		line.width_curve = curve
		if !net_active:
			line.default_color = Color("#ffffff", 1)
		else:
			line.default_color = Color("#ffcccc", 0.5)
		
		for i in 50:
			
			
			var pos = (start_pos-final_pos).normalized()*((start_pos.distance_to(final_pos)/50)*i)
			pos += Vector2(0, exp(0.1*(i+10))*(start_pos.distance_to(final_pos)/2000))

			line.add_point(pos)
		
		#line.add_point((start_pos-final_pos).normalized()*start_pos.distance_to(final_pos))
	
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
			

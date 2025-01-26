extends Node2D

var net_prefab = preload("res://Prefabs/net.tscn")

var line:Line2D

var reel1:Line2D
var reel2:Line2D
var reel3:Line2D

var reel_distance:float = 0
var last_reel_pos:Vector2 = Vector2(-1, -1)
var reel_speed:float = 0
var reel_speed_multiplier:float = 50

var reel_success_proximity:float = 100

var ship_pos = Vector2(1280, 1212) #Needs to be updated to be the ships actualy position every frame

var start_pos: Vector2 = Vector2(-1, -1)
var final_pos: Vector2

var launch_direction:Vector2
var launch_force:float

var is_held:bool = false

var once:bool = false

var twice:bool = false

var pressed:bool = false

var net:RigidBody2D

var net_active = false

var net_caught:bool = false
var was_caught:bool = false

var RopePoint1:Vector2
var RopePoint2:Vector2
var RopePoint3:Vector2

func _ready() -> void:
	PlayerInfo.control_logic_ref = self

func launch():
	if !once:
		if !net_active:
			if PlayerInfo.nets > 0:
				PlayerInfo.nets -= 1
				launch_direction = (start_pos-final_pos).normalized()
				launch_force = start_pos.distance_to(final_pos)
				#print("-------Launch-------")
				#print("Direction:")
				#print(launch_direction)
				#print("Force:")
				#print(launch_force)
				#print("Start:")
				#print(start_pos)
				#print("Final:")
				#print(final_pos)

				net = net_prefab.instantiate()
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
	if reel1 != null:
			reel1.queue_free()
			reel2.queue_free()
			reel3.queue_free()
	if net_caught:
		if RopePoint2.distance_to(ship_pos) <= reel_success_proximity:
			net.death()
			PlayerInfo.current_bubbles += 1
		net.linear_velocity = RopePoint2.direction_to(ship_pos).normalized()*(reel_speed*reel_speed_multiplier*delta)
		
		
		reel1 = Line2D.new()
		add_child(reel1)
		reel1.position = ship_pos
		reel1.add_point(Vector2(0, 0))
		reel1.add_point(RopePoint1-ship_pos)
		var curve = Curve.new()
		curve.add_point(Vector2(0.2, 0.2))
		curve.add_point(Vector2(1, 1))
		reel1.antialiased = true
		reel1.end_cap_mode = Line2D.LINE_CAP_ROUND
		reel1.begin_cap_mode = Line2D.LINE_CAP_ROUND
		reel1.width_curve = curve
		
		reel2 = Line2D.new()
		add_child(reel2)
		reel2.position = ship_pos
		reel2.add_point(Vector2(0, 0))
		reel2.add_point(RopePoint2-ship_pos)
		reel2.antialiased = true
		reel2.end_cap_mode = Line2D.LINE_CAP_ROUND
		reel2.begin_cap_mode = Line2D.LINE_CAP_ROUND
		reel2.width_curve = curve
		
		reel3 = Line2D.new()
		add_child(reel3)
		reel3.position = ship_pos
		reel3.add_point(Vector2(0, 0))
		reel3.add_point(RopePoint3-ship_pos)
		reel3.antialiased = true
		reel3.end_cap_mode = Line2D.LINE_CAP_ROUND
		reel3.begin_cap_mode = Line2D.LINE_CAP_ROUND
		reel3.width_curve = curve
		
		reel1.default_color = Color("#633507", 1)
		reel2.default_color = Color("#633507", 1)
		reel3.default_color = Color("#633507", 1)
		
	else:
		
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
	if net_caught:
		was_caught = true
		pressed = false
		once = false
		twice = false
		if event is InputEventScreenDrag or event is InputEventScreenTouch:
			if last_reel_pos != Vector2(-1, -1):
				reel_speed = last_reel_pos.distance_to(event.position)
				reel_distance += last_reel_pos.distance_to(event.position) 
			
			last_reel_pos = event.position
	else:
		if !PlayerInfo.pufferpop_button_ref.handled:
			if event is InputEventScreenTouch:
				pressed = event.pressed
				if pressed:
					start_pos = Vector2(-1, -1)
				if !was_caught:
					
					if !pressed:
						twice = true
					else:
						once = false
				else:
					start_pos = Vector2(-1, -1)
				was_caught = false
			if event is InputEventScreenDrag or event is InputEventScreenTouch:
				if start_pos == Vector2(-1, -1):
					start_pos = event.position
				final_pos = event.position
					

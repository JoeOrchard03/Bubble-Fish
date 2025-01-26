extends RigidBody2D

var dad
var caught:bool = false
var slow_down:float = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if caught:
		linear_velocity = lerp(linear_velocity, Vector2(0, 0), slow_down*delta)
		$Net.look_at(dad.ship_pos)
		$Net.rotation_degrees-=180
		dad.RopePoint1 = $Net/RopePoint1.global_position
		dad.RopePoint2 = $Net/RopePoint2.global_position
		dad.RopePoint3 = $Net/RopePoint3.global_position
	else:
		$Net.look_at(global_position+linear_velocity)
		$Net.rotation_degrees-=90
	
	if global_position.y >= 1440 or global_position.x >= 2560 or global_position.x <= 0:
		dad.net_active = false
		dad.net_caught = false
		queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if !dad.net_caught:
		#dad.start_pos = Vector2(-1, -1)
		dad.reel_speed = 0
		dad.RopePoint1 = Vector2(-1, -1)
		dad.RopePoint2 = Vector2(-1, -1)
		dad.RopePoint3 = Vector2(-1, -1)
		gravity_scale = 0
		caught = true
		dad.net_caught = true
		$Net.texture = load("res://Art/Nets/Closed Brown.png")
	

func death():
	dad.net_active = false
	dad.net_caught = false
	queue_free()

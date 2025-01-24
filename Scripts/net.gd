extends Sprite2D

func zoom(direction, force):
	$RigidBody2D.apply_central_impulse(Vector2(10000, 10000))

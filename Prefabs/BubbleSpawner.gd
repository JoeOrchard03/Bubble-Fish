extends Node2D

var screenHeight
var randomSpawnPos
var rng = RandomNumberGenerator.new()

@export var numOfBubbles = 0
@export var bubbleImgRadius = 85
@export var bubblePrefab = preload("res://Prefabs/Bubble.tscn")

@export var minimumSpawnDelay = 0.5
@export var maximumSpawnDelay = 1

var positions:Array[Vector2] = []

func _ready():
	screenHeight = get_viewport().size
	for i in numOfBubbles:
		Spawn()
	

func RandomPositions() -> Vector2:
	while true:
		var pos = Vector2(rng.randf_range(bubbleImgRadius, screenHeight.x - bubbleImgRadius), rng.randf_range(bubbleImgRadius, screenHeight.y - bubbleImgRadius))
		if not tooClose(pos):
			return pos
	return Vector2(0,0)
			
func tooClose(queryPos) -> bool:
	for i in positions:
		if queryPos.distance_to(i) < bubbleImgRadius * 2:
			return true
	return false
		

func Spawn():
	print("Running spawn")
	var obj = bubblePrefab.instantiate()
	var pos = RandomPositions()
	obj.position = pos
	add_child(obj)
	obj.dad = self
	positions.append(pos)

func _on_spawn_delay_timeout() -> void:
	Spawn()

func suicide(pos:Vector2):
	var index = positions.find(pos)
	positions.remove_at(index)
	var delay = randf_range(minimumSpawnDelay, maximumSpawnDelay)
	$SpawnDelay.start(delay)

extends Node2D

var screenHeight
var randomSpawnPos
var rng = RandomNumberGenerator.new()

@export var numOfBubbles = 0
@export var bubblePrefab = preload("res://Prefabs/Bubble.tscn")

var positions:Array[Vector2] = [Vector2(0,0)]

func _ready():
	screenHeight = get_viewport().size
	
	for i in numOfBubbles:
		Spawn()

func RandomPositions:
	for i in numOfBubbles:
		while positions.size()

func Spawn():
	print("Running spawn")
	var obj = bubblePrefab.instantiate()
	randomSpawnPos = Vector2(rng.randf_range(0, screenHeight.x), rng.randf_range(0, screenHeight.y))
	print(randomSpawnPos)
	obj.position = randomSpawnPos
	add_child(obj)

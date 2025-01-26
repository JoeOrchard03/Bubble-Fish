extends Node2D

var screenHeight
var randomSpawnPos
var rng = RandomNumberGenerator.new()

@export var numOfBubbles = 0
@export var bubbleImgRadius = 128
@export var bubblePrefab = preload("res://Prefabs/Bubble.tscn")

@export var minimumSpawnDelay = 0.5
@export var maximumSpawnDelay = 1

var prev_section = -1


func _ready():
	for i in 12:
		Spawn()

func Spawn():
	var timer = Timer.new()
	add_child(timer)
	timer.one_shot = true
	timer.start(randf_range(0, 8))
	timer.connect("timeout", _on_spawn_delay_timeout)
	
	

func _on_spawn_delay_timeout() -> void:
	var obj = bubblePrefab.instantiate()
	
	var temp = -1
	while temp == -1:
		temp = randi_range(1, 6)
		if temp == prev_section or temp+1 == prev_section or temp-1 == prev_section:
			temp = -1
	prev_section = temp
	print(temp)
	var pos = Vector2(((temp*373.3)-186.7)+randf_range(-186.7, 186.7)+160, 2000)
	print(pos)
	
	obj.position = pos
	add_child(obj)
	obj.dad = self

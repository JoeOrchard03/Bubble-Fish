extends Node2D

# Common Fish
@export var Angle:Sprite2D
@export var Car:Sprite2D
@export var Cutlery:Sprite2D
@export var Dementia:Sprite2D
@export var Fernando:Sprite2D
@export var Frog:Sprite2D
@export var Funny_man:Sprite2D
@export var Glorbo:Sprite2D
@export var Goldfish:Sprite2D
@export var Hermie:Sprite2D
@export var Munchy:Sprite2D
@export var Pinoccio:Sprite2D
@export var Puppy:Sprite2D
@export var Sporkle:Sprite2D
@export var Aeuh:Sprite2D

# Rare Fish
@export var Bathbomb:Sprite2D
@export var Beach:Sprite2D
@export var Cronch:Sprite2D
@export var Doggo:Sprite2D
@export var Flappy_Bird:Sprite2D
@export var Gorgan:Sprite2D
@export var Moomoo:Sprite2D
@export var Norton:Sprite2D
@export var Scrimblo:Sprite2D
@export var Slormp:Sprite2D

# Legendary Fish
@export var Beepo:Sprite2D
@export var Eaten_The_Rich:Sprite2D
@export var Forg:Sprite2D
@export var Shork:Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	for i in PlayerInfo.common_fish.size():
		print(i)
		var fishString:String = PlayerInfo.common_fish[i]
		var fish_node:Sprite2D = null
		if fishString == "Angle":
			fish_node = Angle
		elif fishString == "Car":
			fish_node = Car
		elif fishString == "Cutlery":
			fish_node = Cutlery
		elif fishString == "Dementia":
			fish_node = Dementia
		elif fishString == "Fernando":
			fish_node = Fernando
		elif fishString == "Frog":
			fish_node = Frog
		elif fishString == "Funny Man":
			fish_node = Funny_man
		elif fishString == "Glorbo":
			fish_node = Glorbo
		elif fishString == "Goldfish":
			fish_node = Goldfish
		elif fishString == "Hermie":
			fish_node = Hermie
		elif fishString == "Munchy":
			fish_node = Munchy
		elif fishString == "Pinoccio":
			fish_node = Pinoccio
		elif fishString == "Puppy":
			fish_node = Puppy
		elif fishString == "Sporkle":
			fish_node = Sporkle
		elif fishString == "Aeuh":
			fish_node = Aeuh
		if fish_node != null:
			show_fish(PlayerInfo.common_fish_img[i], fish_node, fishString, Vector2(0.5, 0.5))
	# Rare
	for i in PlayerInfo.rare_fish.size():
		print(i)
		var fishString:String = PlayerInfo.rare_fish[i]
		var fish_node:Sprite2D = null
		if fishString == "Bathbomb":
			fish_node = Bathbomb
		elif fishString == "Beach":
			fish_node = Beach
		elif fishString == "Cronch":
			fish_node = Cronch
		elif fishString == "Doggo":
			fish_node = Doggo
		elif fishString == "Flappy Birb":
			fish_node = Flappy_Bird
		elif fishString == "Gorgan":
			fish_node = Gorgan
		elif fishString == "Moomoo":
			fish_node = Moomoo
		elif fishString == "Norton":
			fish_node = Norton
		elif fishString == "Scrimblo":
			fish_node = Scrimblo
		elif fishString == "Slormp":
			fish_node = Slormp
		if fish_node != null:
			show_fish(PlayerInfo.rare_fish_img[i], fish_node, fishString, Vector2(0.4, 0.4))
	# Legendary
	for i in PlayerInfo.legendary_fish.size():
		print(i)
		var fishString:String = PlayerInfo.legendary_fish[i]
		var fish_node:Sprite2D = null
		if fishString == "Beepo":
			fish_node = Beepo
		elif fishString == "Eaten The Rich":
			fish_node = Eaten_The_Rich
		elif fishString == "Forg":
			fish_node = Forg
		elif fishString == "Shork":
			fish_node = Shork
		if fish_node != null:
			show_fish(PlayerInfo.legendary_fish_img[i], fish_node, fishString, Vector2(0.3, 0.3))
		
		
func show_fish(img_path:String, parent:Sprite2D, fish_name:String, fish_scale:Vector2):
	var fish:Sprite2D = Sprite2D.new()
	fish.texture = load(img_path)
	parent.add_child(fish)
	parent.get_node("CommonName/FishName").text = fish_name
	fish.scale = fish_scale

func _on_button_pressed() -> void:
	EffectsPlayer.stream = load("res://Audio/UI Sounds/button press 4.wav")
	EffectsPlayer.play()
	get_tree().change_scene_to_file("res://Scenes/MainScene.tscn")

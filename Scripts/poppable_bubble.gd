extends AnimatedSprite2D

var common = ["Sporkle", "Car", "Munchy", "Puppy", "Cutlery", "Frog", "Dementia", "Pinoccio", "Hermie", "Angle", "Fernando", "Glorbo", "Aeuh", "Funny Man", "Goldfish"]
var common_img = [
	"res://Art/Fish/Common/Sporkle.png", 
	"res://Art/Fish/Common/Car.png",
	"res://Art/Fish/Common/Munchy.png",
	"res://Art/Fish/Common/Puppy.png",
	"res://Art/Fish/Common/Cutlery.png",
	"res://Art/Fish/Common/Frog.png",
	"res://Art/Fish/Common/Dementia.png",
	"res://Art/Fish/Common/Pinoccio.png",
	"res://Art/Fish/Common/Hermie.png",
	"res://Art/Fish/Common/Angle.png",
	"res://Art/Fish/Common/Fernando.png",
	"res://Art/Fish/Common/Glorbo.png",
	"res://Art/Fish/Common/æuh.png",
	"res://Art/Fish/Common/FunnyMan.png",
	"res://Art/Fish/Common/Goldfish Sprite.png"
]

var rare = ["Bathbomb", "Beach", "Cronch", "Flappy Birb", "Gorgan", "Moomoo", "Norton", "Scrimblo", "Slormp"]
var rare_img = [
	"res://Art/Fish/Rare/Bathbomb.png",
	"res://Art/Fish/Rare/Beach.png",
	"res://Art/Fish/Rare/Cronch.png",
	"res://Art/Fish/Rare/Flappy Birb.png",
	"res://Art/Fish/Rare/Gorgan.png",
	"res://Art/Fish/Rare/Moomoo.png",
	"res://Art/Fish/Rare/Norton.png",
	"res://Art/Fish/Rare/Scrimblo.png",
	"res://Art/Fish/Rare/Slormp.png"
]

var legendary = ["Placeholder 1", "Placeholder 2", "Placeholder 3"]
var legendary_img = []

var common_chance:float = 60
var rare_chance:float = 30
var legendary_chance:float = 10

var silver_coin = 70
var gold_coin = 30

var background_chance = 50
var player_chance = 50

var fish_chance = 60
var coin_chance = 30
var cosmetic_chance = 10

var reward
var reward_img = "res://Art/Sprites/icon.svg"
var rarity:int = 0

var fishIndex

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var reward_type = randf_range(0, 100)
	
	# Fish
	if reward_type <= fish_chance:
		var chance = randf_range(0, 100)
		
		# Common
		if chance <= common_chance:
			fishIndex = randi_range(0, common.size()-1)
			reward = ("Common")
			reward_img = common_img[fishIndex]
			
		# Rare
		elif chance <= common_chance+rare_chance:
			fishIndex = randi_range(0, rare.size()-1)
			reward = ("Rare")
			reward_img = rare_img[fishIndex]
			rarity = 1
			
		# Legendary
		elif chance <= common_chance+rare_chance+legendary_chance:
			fishIndex = randi_range(0, legendary.size()-1)
			reward = ("legendary")
			rarity = 2
	# Coin
	elif reward_type <= fish_chance+coin_chance:
		var chance = randf_range(0, 100)
		rarity = -1
		# Silver Coin
		if chance <= silver_coin:
			reward = ("Silver Coin")
			reward_img = "res://Art/UI/Coins/coin_silver.png"
		# Gold Coin
		elif chance <= silver_coin+gold_coin:
			reward = ("Gold Coin")
			reward_img = "res://Art/UI/Coins/coin_gold.png"
	
	# Cosmetic
	elif reward_type <= fish_chance+coin_chance+cosmetic_chance:
		reward = ("Cosmetic")


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventScreenTouch and event.is_pressed():
		$Area2D.visible = false
		print(reward)
		play("Pop")
		PlayerInfo.current_bubbles-=1
		
	


func _on_animation_finished() -> void:
	var box:Sprite2D = get_parent()
	$RewardSprite.texture = load(reward_img)
	if rarity == 0:
		$RewardSprite.scale = Vector2(0.5, 0.5)
	elif rarity == 1:
		box.texture = load("res://Art/UI/Pufferpop/rare_fish_box.png")
		$RewardSprite.scale = Vector2(0.4, 0.4)
	elif rarity == 2:
		box.texture = load("res://Art/UI/Pufferpop/legendary_fish_box.png")
		$RewardSprite.scale = Vector2(0.1, 0.1)
	elif rarity == -1: # Coins
		$RewardSprite.scale = Vector2(0.3, 0.3)
	if reward == "Silver Coin":
		PlayerInfo.silver_coins+=15
	elif reward == "Gold Coin":
		PlayerInfo.gold_coins+=3
	elif reward == "Common":
		if !common[fishIndex] in PlayerInfo.common_fish:
			PlayerInfo.common_fish.append(common[fishIndex])
			PlayerInfo.common_fish_img.append(common_img[fishIndex])
		else:
			PlayerInfo.silver_coins+=10
	elif reward == "Rare":
		if !rare[fishIndex] in PlayerInfo.rare_fish:
			PlayerInfo.rare_fish.append(rare[fishIndex])
			PlayerInfo.rare_fish_img.append(rare_img[fishIndex])
		else:
			PlayerInfo.silver_coins+=25
	elif reward == "Legendary":
		if !legendary[fishIndex] in PlayerInfo.legendary_fish:
			PlayerInfo.legendary_fish.append(legendary[fishIndex])
			PlayerInfo.legendary_fish_img.append(legendary_img[fishIndex])
		else:
			PlayerInfo.gold_coins+=5
	

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$SilverCoins/SilverCoinsLabel.text = "x" + str(PlayerInfo.silver_coins)
	$GoldCoins/GoldCoinsLabel.text = "x" + str(PlayerInfo.gold_coins)
	$Nets/NetsLabel.text = "x" + str(PlayerInfo.nets)
	$Nets.value = PlayerInfo.radial_fill

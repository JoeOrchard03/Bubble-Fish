extends Node2D

var net_priceA:int = 2
var net_priceB:int = 15

func _on_open_brown_pressed() -> void:
	if PlayerInfo.silver_coins >= net_priceA:
		PlayerInfo.silver_coins -= net_priceA
		PlayerInfo.nets += 1


func _on_open_brown_2_pressed() -> void:
	if PlayerInfo.silver_coins >= net_priceB:
		PlayerInfo.silver_coins -= net_priceB
		PlayerInfo.nets += 10


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainScene.tscn")

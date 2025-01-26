extends Node

var common_fish = []
var rare_fish = []
var legendary_fish = []

var common_fish_img = []
var rare_fish_img = []
var legendary_fish_img = []

var silver_coins:int = 0
var gold_coins:int = 0

var nets:int = 0

var current_bubbles:int = 0

var control_logic_ref:Node
var pufferpop_button_ref:Node

var timer:Timer

var backgrounds = ["res://Art/Backgrounds/NightDay_NOcircle.png"]

func _process(delta: float) -> void:
	if nets <= 0:
		if timer == null:
			timer = Timer.new()
			add_child(timer)
			timer.start(2)
			timer.connect("timeout", timer_finished)
	else:
		if timer != null:
			timer.queue_free()

func timer_finished():
	nets+=1
	timer.queue_free()

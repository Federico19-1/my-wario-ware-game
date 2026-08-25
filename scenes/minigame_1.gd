extends Node2D
@onready var themed_timer: Node2D = $ThemedTimer
var garlic_collected = 0
var timer_end = false
var game_over = false

func _ready() -> void:
	$Garlic.garlic_collected.connect(garlic_collect)
	$Garlic2.garlic_collected.connect(garlic_collect)
	$Garlic3.garlic_collected.connect(garlic_collect)
	
	await themed_timer.Timer(10.0)
	timer_end = true

func _process(_delta: float) -> void:
	if game_over:
		return
	if garlic_collected >= 3:
		game_over = true
		get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
		return
	if timer_end:
		game_over = true
		# Global.minigames_done -= 1
		Global.lives -= 1
		get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")

func garlic_collect() -> void:
	garlic_collected = garlic_collected + 1
	return

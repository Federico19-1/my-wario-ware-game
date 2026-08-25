extends Node2D

@onready var themed_timer: Node2D = $ThemedTimer
var garlic_collected = 0
var timer_end = false
var game_over = false

func _ready():
	await themed_timer.Timer(10.0)
	timer_end = true

func _process(_delta):
	if garlic_collected == 5:
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://scenes/win_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
	
	if timer_end and not game_over:
		game_over = true
		# Global.minigames_done -= 1
		Global.lives -= 1
		get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")

func garlic_collect():
	garlic_collected += 1

func _on_button_1_pressed() -> void:
	$Button_1.hide()
	garlic_collect()

func _on_button_2_pressed() -> void:
	$Button_2.hide()
	garlic_collect()

func _on_button_3_pressed() -> void:
	$Button_3.hide()
	garlic_collect()

func _on_button_4_pressed() -> void:
	$Button_4.hide()
	garlic_collect()

func _on_button_5_pressed() -> void:
	$Button_5.hide()
	garlic_collect()

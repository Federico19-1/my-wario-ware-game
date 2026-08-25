extends Node2D
@onready var themed_timer: Node2D = $ThemedTimer
@onready var tarallo: TextureButton = $Tarallo

var timer_end = false
var game_over = false
var tarallo_toccato = false

func _ready() -> void:
	await themed_timer.Timer(10.0)
	timer_end = true

func _process(_delta: float) -> void:
	if game_over:
		return
	if tarallo_toccato:
		game_over = true
		Global.lives -= 1
		get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
		return
	if timer_end:
		game_over = true
		get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")

func _on_tarallo_pressed() -> void:
	tarallo_toccato = true

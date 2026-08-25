extends Node2D
@onready var themed_timer: Node2D = $ThemedTimer
@onready var tarallo: TextureButton = $Tarallo

var bites = 0
var max_bites = 3  # ora bastano 3 morsi per finire il tarallo
var timer_end = false
var game_over = false

var bite_textures = [
	preload("res://assets/tarallo_morsi/tarallo_0.png"),
	preload("res://assets/tarallo_morsi/tarallo_1.png"),
	preload("res://assets/tarallo_morsi/tarallo_2.png"),
]

func _ready() -> void:
	await themed_timer.Timer(10.0)
	timer_end = true

func _process(_delta: float) -> void:
	if game_over:
		return
	if bites >= max_bites:
		game_over = true
		get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
		return
	if timer_end:
		game_over = true
		Global.lives -= 1
		get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")

func _on_tarallo_pressed() -> void:
	bites += 1
	if bites < bite_textures.size():
		tarallo.texture_normal = bite_textures[bites]
	else:
		tarallo.hide()

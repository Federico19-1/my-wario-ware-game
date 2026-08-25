extends Node2D

func _ready() -> void:
	Global.minigames_done = 0
	Global.lives = 5



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title_scene.tscn")

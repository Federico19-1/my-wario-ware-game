extends Node2D
#This is just a new comment

# Called when the node enters the scene tree for the
func _ready() -> void:
	MusicManager.play_music()


# Called every frame. 'delta' is the elapsed time sin
func _process(_delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://timer_screen.tscn")


func _on_start_pressed() -> void:
		get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settings_scene.tscn")

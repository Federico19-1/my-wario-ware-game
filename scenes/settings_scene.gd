extends Node2D

@onready var volume_slider: HSlider = $VBoxContainer/VolumeSlider
@onready var fullscreen_toggle: CheckButton = $VBoxContainer/FullscreenToggle

func _ready() -> void:
	MusicManager.play_music()
	
	# Imposta lo slider al volume attuale del bus Master
	var current_db = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	volume_slider.value = db_to_linear(current_db)
	
	# Imposta il toggle in base allo stato attuale della finestra
	fullscreen_toggle.button_pressed = (DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN)

func _on_volume_slider_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), db)

func _on_fullscreen_toggle_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title_scene.tscn")

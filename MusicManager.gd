extends Node

@onready var music_player: AudioStreamPlayer = AudioStreamPlayer.new()

func _ready() -> void:
	add_child(music_player)
	music_player.stream = preload("res://03. Main Menu.mp3")
	music_player.autoplay = false
	# Non chiamiamo più .play() qui: la musica parte solo quando
	# le scene giuste la richiedono esplicitamente

func play_music() -> void:
	if not music_player.playing:
		music_player.play()

func stop_music() -> void:
	music_player.stop()

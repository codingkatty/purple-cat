extends AudioStreamPlayer

const level_music = preload("res://this_cat_spins.mp3")

func _play_music(music: AudioStream, volume = 0.2):
	if stream == music:
		return

	stream = music
	volume_db = volume
	play()

func play_music_level():
	_play_music(level_music)

func stop_music():
	stream = null
	stop()

extends AudioStreamPlayer


func _init() -> void:
	autoplay = true


func _process(delta: float) -> void:
	volume_db = -15 + Global.music_volume / 5
	volume_db = -15 + Global.music_volume / 5

extends TextureButton


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if button_pressed:
		position = get_global_mouse_position() - size / 2


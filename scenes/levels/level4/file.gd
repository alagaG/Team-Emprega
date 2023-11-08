extends TextureButton


@onready var collision : CollisionShape2D = $Area2D/CollisionShape2D


func _process(delta: float) -> void:
	if not is_node_ready() or is_queued_for_deletion(): return
	if button_pressed:
		position = get_global_mouse_position() - size / 2
		collision.disabled = true
	else:
		collision.disabled = false

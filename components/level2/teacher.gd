class_name CustomNPC
extends NPC


func _process(delta: float) -> void:
	if is_node_ready():
		if action_hint.visible and Input.is_action_just_pressed("p1_act"):
			emit_signal("dialoged")


func set_dialog(text:String) -> void:
	dialog.text = text
	dialog_panel.visible = true

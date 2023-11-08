extends Level


@export var ceo : NPC


func _ready() -> void:
	super()
	ceo.connect("dialoged", _on_ceo_dialog)


func _on_ceo_dialog() -> void:
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://scenes/levels/level4/entrevista1.tscn")

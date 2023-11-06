extends Node


@onready var backpack : Area2D = $Objects/Backpack
@onready var door : Area2D = $Objects/Door


func _ready() -> void:
	backpack.connect("body_entered", _on_backpack_picked)
	door.connect("body_entered", _on_door_try)


func _on_backpack_picked(by:Node) -> void:
	backpack.queue_free()
	door.open()


func _on_door_try(by:Node) -> void:
	if backpack == null:
		get_tree().exit()

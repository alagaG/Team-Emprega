@tool
class_name LevelManager
extends Node


# Exports
@export var level_scene : PackedScene = null :
	set = set_level
# Nodes
var current_level : Level


func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	if Input.is_key_pressed(KEY_R):
		set_level(level_scene)


func set_level(value:PackedScene) -> void:
	for child in get_children():
		child.queue_free()
	level_scene = value
	if level_scene != null:
		var instance : Node = level_scene.instantiate()
		if instance is Level:
			current_level = instance
			instance.connect("completed", set_level)
			add_child.call_deferred(instance)

extends ColorRect


@export var exit : Button


func _ready() -> void:
	exit.connect("button_down", _exit_pressed)


func _exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")Daniel

extends Node


@export var back_btn : Button
@export var credits_btn : Button


func _ready() -> void:
	back_btn.connect("pressed", _on_back)
	credits_btn.connect("pressed", _on_credits)


func _on_back() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_credits() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")

extends Node


@export var play_btn : Button
@export var settings_btn : Button
@export var exit_btn : Button
@export var credits_btn : Button


func _ready() -> void:
	play_btn.connect("button_down", _on_play_pressed)
	settings_btn.connect("button_down", _on_settings_pressed)
	exit_btn.connect("button_down", _on_exit_pressed)
	credits_btn.connect("button_down", _on_credit_pressed)


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_manager.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_credit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")

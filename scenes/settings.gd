extends ColorRect


@export var music_scroller : HSlider
@export var sound_scroller : HSlider
@export var full_screen_box : CheckBox
@export var exit_btn : Button


func _ready() -> void:
	music_scroller.connect("drag_ended", _music_value_changed)
	sound_scroller.connect("drag_ended", _sound_value_changed)
	full_screen_box.connect("toggled", _full_screen)
	exit_btn.connect("button_down", _exit)


func _music_value_changed(changed:bool) -> void:
	var value = music_scroller.value
	


func _sound_value_changed(changed:bool) -> void:
	var value = sound_scroller.value


func _full_screen(state:bool) -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if state else DisplayServer.WINDOW_MODE_WINDOWED)


func _exit() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

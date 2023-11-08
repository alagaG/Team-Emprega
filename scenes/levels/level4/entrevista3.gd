extends Node


@export var mails : Area2D
@export var docs : Area2D
@export var trash_can : Area2D
@export var time_left : Label
@export var timer : Timer
@export var files : Node
@export var result : Label


func _ready() -> void:
	mails.connect("body_entered", _icon_trouched.bind("Mail"))
	docs.connect("body_entered", _icon_trouched.bind("Doc"))
	trash_can.connect("body_entered", _icon_trouched.bind("Trash"))
	await get_tree().create_timer(2).timeout
	timer.start()
	files.process_mode = Node.PROCESS_MODE_INHERIT
	time_left.visible = true
	timer.connect("timeout", _on_time_end)


func _process(delta: float) -> void:
	if is_node_ready():
		time_left.text = "%d" % timer.time_left


func _icon_trouched(body:Node2D, type:String) -> void:
	if body.get_parent().name.begins_with(type):
		body.get_parent().queue_free()


func _on_time_end() -> void:
	print(files.get_child_count())
	if files.get_child_count() > 0:
		files.process_mode = Node.PROCESS_MODE_DISABLED
		result.text = "Falhou!
		Vamos de Novo"
		result.visible = true
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scenes/levels/level4/entrevista3.tscn")
	else:
		files.process_mode = Node.PROCESS_MODE_DISABLED
		result.visible = true
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scenes/congratulations.tscn")

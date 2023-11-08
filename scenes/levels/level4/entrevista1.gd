extends Node


@export var space0 : Area2D
@export var space1 : Area2D
@export var space2 : Area2D

@export var answer_feedback0 : Sprite2D
@export var answer_feedback1 : Sprite2D
@export var answer_feedback2 : Sprite2D

@export var answers : Node
@export var label : Label

func _ready() -> void:
	space0.connect("body_entered", _on_space_touched.bind(space0, answer_feedback0))
	space0.connect("body_exited", _on_space_exited.bind(answer_feedback0))
	space1.connect("body_entered", _on_space_touched.bind(space1, answer_feedback1))
	space1.connect("body_exited", _on_space_exited.bind(answer_feedback1))
	space2.connect("body_entered", _on_space_touched.bind(space2, answer_feedback2))
	space2.connect("body_exited", _on_space_exited.bind(answer_feedback2))


func _on_space_touched(body:Node2D, space:Area2D, feedback:Sprite2D) -> void:
	feedback.feedback(body.get_parent() == space.right_answer)
	if answer_feedback0.is_right() and answer_feedback1.is_right() and answer_feedback2.is_right():
		answers.process_mode = Node.PROCESS_MODE_DISABLED
		label.visible = true
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://scenes/levels/level4/entrevista2.tscn")


func _on_space_exited(body:Node2D, feedback:Sprite2D) -> void:
	if not answer_feedback0.is_right() or not answer_feedback1.is_right() or not answer_feedback2.is_right():
		feedback.reset()

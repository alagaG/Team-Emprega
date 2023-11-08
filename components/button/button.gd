class_name LevelButton
extends Area2D


# Nodes
@onready var sprite : Sprite2D = $Sprite
@onready var hint : Sprite2D = $ActionHint
# Vars
var inside_range : bool = false
signal activated()


func _ready() -> void:
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)


func _process(delta: float) -> void:
	hint.visible = inside_range
	if inside_range and Input.is_action_just_pressed("p2_act"):
		emit_signal("activated")


func _on_body_entered(body:Node2D) -> void:
	if body is Player and body.is_introvert():
		inside_range = true


func _on_body_exited(body:Node2D) -> void:
	if body is Player and body.is_introvert():
		inside_range = false

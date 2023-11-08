extends Area2D


# Exports
@export var elevator : Elevator
# Nodes
@onready var action_hint : Sprite2D = $ActionHint


func _ready() -> void:
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)


func _process(delta: float) -> void:
	if action_hint and action_hint.visible:
		if Input.is_action_just_pressed("p2_act"):
			elevator.activate()


func _on_body_entered(body:Node2D) -> void:
	if not body is Player or body.is_extrovert(): return
	if is_node_ready():
		action_hint.visible = true


func _on_body_exited(body:Node2D) -> void:
	if not body is Player or body.is_extrovert(): return
	if is_node_ready():
		action_hint.visible = false

@tool
class_name NPC
extends Area2D


@export var data : NPCData = DEFAULT_DATA :
	set = set_data
@export var flip : bool = false
# Nodes
@onready var sprite : AnimatedSprite2D = $Sprite
@onready var action_hint : Sprite2D = $ActionHint
@onready var dialog_panel : PanelContainer = $Panel
@onready var dialog : Label = $Panel/Margin/Label
# Vars
const DEFAULT_DATA : NPCData = preload("res://resources/npc_data/default.tres")
signal dialoged()


func _ready() -> void:
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)
	set_data(data)


func set_data(value:NPCData) -> void:
	data = value if value != null else DEFAULT_DATA
	update_visual()


func update_visual() -> void:
	if is_node_ready():
		sprite.sprite_frames = data.animation
		sprite.flip_h = flip
		dialog.text = data.dialog[randi_range(0, data.dialog.size()-1)]


func _process(delta: float) -> void:
	if is_node_ready():
		if action_hint.visible and Input.is_action_just_pressed("p1_act"):
			dialog.text = data.dialog[randi_range(0, data.dialog.size()-1)]
			dialog_panel.visible = true
			emit_signal("dialoged")


func _on_body_entered(collider:Node2D) -> void:
	if not collider is Player or collider.is_introvert(): return
	if is_node_ready():
		action_hint.visible = true


func _on_body_exited(collider:Node2D) -> void:
	if not collider is Player or collider.is_introvert(): return
	if is_node_ready():
		action_hint.visible = false
		dialog_panel.visible = false

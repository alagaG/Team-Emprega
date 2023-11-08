@tool
class_name Item
extends Area2D


@export var texture : CompressedTexture2D :
	set = set_texture
# Nodes
@onready var sprite : Sprite2D = $Sprite
signal touched(item:Item)


func _ready() -> void:
	set_texture(texture)
	connect("body_entered", _on_body_touched)


func set_texture(value:CompressedTexture2D) -> void:
	texture = value
	if is_node_ready():
		sprite.texture = texture


func _on_body_touched(by:Node2D) -> void:
	if by is Player: emit_signal("touched", self)

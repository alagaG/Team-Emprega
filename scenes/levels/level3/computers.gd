class_name Computers
extends Area2D


@export var texture_on : CompressedTexture2D 
@export var texture_off : CompressedTexture2D 

@onready var sprite : Sprite2D = $Sprite
signal activated()


func _ready() -> void:
	connect("body_entered", _on_body_entered)


func activate() -> void:
	if is_node_ready():
		sprite.texture = texture_on if sprite.texture == texture_off else texture_off


func _on_body_entered(body:Node2D) -> void:
	if body is Player and sprite.texture == texture_on:
		emit_signal("activated")

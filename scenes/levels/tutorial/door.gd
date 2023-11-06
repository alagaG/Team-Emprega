extends Area2D


@onready var sprite : Sprite2D = $Sprite
# Vars
const OPENED_TEXTURE : CompressedTexture2D = preload("res://resources/textures/door_opened.png")


func open() -> void:
	sprite.texture = OPENED_TEXTURE

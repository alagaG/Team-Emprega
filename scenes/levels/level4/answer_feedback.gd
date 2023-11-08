extends Sprite2D


@export var right_texture : CompressedTexture2D
@export var wrong_texture : CompressedTexture2D


func reset() -> void:
	texture = null


func feedback(answer:bool) -> void:
	texture = right_texture if answer else wrong_texture


func is_right() -> bool:
	return texture == right_texture

class_name PlayerData
extends Resource


@export var animations : SpriteFrames
@export var introvert : bool
@export_group("Movement")
@export var input_key : String
@export var walk_speed : int 
@export var jump_speed : int

func has_valid_input_key() -> bool:
	return input_key != ""

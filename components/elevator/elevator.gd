class_name Elevator
extends AnimatableBody2D


@onready var animator : AnimationPlayer = $Animation
# Vars
var last : String = "up"

func activate() -> void:
	if animator and not animator.is_playing():
		animator.play( "down" if last == "up" else "up")
		last = "down" if last == "up" else "up"

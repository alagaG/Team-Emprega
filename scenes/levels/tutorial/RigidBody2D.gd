extends CharacterBody2D


@export var push_speed : int = 50
var gravity : int = ProjectSettings.get_setting("physics/2d/default_gravity")
var pushing : int = 0


func _physics_process(delta: float) -> void:
	if Engine.is_editor_hint(): return
	
	velocity.x = pushing * push_speed
	velocity.y += gravity * delta
	
	pushing = 0
	move_and_slide()


func push(vec:Vector2) -> void:
	pushing = vec.sign().x

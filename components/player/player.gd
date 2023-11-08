@tool
class_name Player
extends CharacterBody2D


# Exports
@export var data : PlayerData = DEFAULT_DATA :
	set = set_data
# Nodes
@onready var sprite : AnimatedSprite2D = $Sprite
@onready var tp_cd : Timer = $TPColdown
# Vars
const DEFAULT_DATA : PlayerData = preload("res://resources/player_data/default.tres")
var walk_speed : int = 0
var jump_speed : int = 0
var gravity : int = ProjectSettings.get_setting("physics/2d/default_gravity")
var introverted : bool = false


func _ready() -> void:
	set_data(data)
	add_to_group("players")


func _physics_process(delta: float) -> void:
	if Engine.is_editor_hint() or not data.has_valid_input_key(): return
	# Add the gravity.
	velocity.y += gravity * delta
	
	# Handle Jump.
	if Input.is_action_just_pressed("%s_jump" % data.input_key) and is_on_floor():
		velocity.y = jump_speed
	
	# Get the input direction.
	var direction = Input.get_axis("%s_left" % data.input_key, "%s_right" % data.input_key)
	velocity.x = direction * walk_speed
	
	var check = move_and_collide(Vector2(velocity.x * delta, 0), true)
	if check != null:
		var collider = check.get_collider()
		if collider != null and collider is Box and is_extrovert():
			collider.velocity.x = velocity.x / 4
	
	move_and_slide()
	
	if not is_node_ready(): return
	
	if velocity.y == 0:
		if velocity.x != 0:
			sprite.flip_h = velocity.x < 0
			sprite.sprite_frames = data.animations
			if not sprite.animation == "walking":
				sprite.play("walking")
		else:
			sprite.sprite_frames = data.animations
			if not sprite.animation == "default":
				sprite.play("default")
	else:
		if not sprite.animation == "fall":
				sprite.play("fall")


func set_data(value:PlayerData) -> void:
	data = value if value != null else DEFAULT_DATA
	walk_speed = data.walk_speed
	jump_speed = data.jump_speed
	if is_node_ready():
		sprite.sprite_frames = data.animations


func teleport(pos:Vector2) -> void:
	position = pos + Vector2(-10 + 20 if is_extrovert() else 0, 0)
	tp_cd.start()


func can_tp() -> bool:
	return tp_cd.time_left == 0


func is_introvert() -> bool:
	return data.introvert


func is_extrovert() -> bool:
	return not data.introvert

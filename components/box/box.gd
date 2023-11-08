@tool
class_name Box
extends CharacterBody2D


@export var texture : CompressedTexture2D :
	set = set_texture
@export var distance : int = 5
# Nodes
@onready var sprite : Sprite2D = $Sprite
@onready var action_hint : Sprite2D = $ActionHint
# Vars
var gravity : int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready() -> void:
	update_visual()


func _process(delta: float) -> void:
	var players : Array = get_tree().get_nodes_in_group("players")
	for p in players:
		if p.is_extrovert():
			if position.distance_to(p.position) < distance:
				action_hint.visible = true
				break
			else:
				action_hint.visible = false


func _physics_process(delta: float) -> void:
	if Engine.is_editor_hint(): return 
	velocity.x *= 0.8
	velocity.y += gravity * delta
	move_and_slide()


func set_texture(value:CompressedTexture2D) -> void:
	texture = value
	update_visual()


func update_visual() -> void:
	if is_node_ready():
		sprite.texture = texture
		action_hint.offset.y = -1-texture.get_height() if texture != null else 0


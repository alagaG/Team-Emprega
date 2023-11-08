extends Area2D


# Nodes
@onready var hint : Sprite2D = $Hint
# Vars
var hovered : bool = false
signal used()


func _ready() -> void:
	connect("body_entered", _on_player_entered)
	connect("body_exited", _on_player_exited)


func _process(_delta: float) -> void:
	if hovered and Input.is_action_just_pressed("p2_act"):
		emit_signal("used")


func _on_player_entered(collider:Node) -> void:
	if not collider is Player and collider.introverted: return
	if is_node_ready():
		hovered = true
		hint.visible = true


func _on_player_exited(collider:Node) -> void:
	if not collider is Player and collider.introverted: return
	if is_node_ready():
		hovered = false
		hint.visible = false

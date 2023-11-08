@tool
extends Area2D


# Exports
@export var target : Node2D
@export var multiple : bool
# Nodes
@onready var collision : CollisionShape2D = $Collision


func _ready() -> void:
	connect("body_entered", _on_body_entered)


func _on_body_entered(body:Node2D) -> void:
	if target != null and body is Player and body.can_tp():
		var players : Array = get_tree().get_nodes_in_group("players")
		for i in range(players.size()):
			var player : Player = players[i]
			player.teleport(target.position)

@tool
class_name Level
extends Node


# Nodes
@onready var camera : Camera2D = $Camera
@onready var tilemap : TileMap = $TileMap
@onready var entities : Node2D = $Entities
@onready var spawn_point : SpawnPoint = $SpawnPoint 
# Vars
const PlayerScene : PackedScene = preload("res://components/player/player.tscn")
const PlayerOneData : PlayerData = preload("res://resources/player_data/extrovert.tres")
const PlayerTwoData : PlayerData = preload("res://resources/player_data/introvert.tres")
signal completed(next:PackedScene)


func _ready() -> void:
	spawn_players()


func spawn_players() -> void:
	if not is_node_ready(): return
	for player in get_tree().get_nodes_in_group("players"):
		player.queue_free()
	
	var player_one = PlayerScene.instantiate()
	player_one.data = PlayerOneData
	player_one.position = spawn_point.position + Vector2(-10, 0)
	var player_two = PlayerScene.instantiate()
	player_two.data = PlayerTwoData
	player_two.position = spawn_point.position + Vector2(10, 0)
	
	entities.add_child(player_one)
	entities.add_child(player_two)

extends Node


# Nodes
@onready var backpack : Area2D = $Objects/Backpack
@onready var door : Area2D = $Objects/HouseDoor
@onready var computer : Area2D = $Objects/Computer
@onready var tutorial_btn = $Objects/TutorialButton


func _ready() -> void:
	backpack.connect("body_entered", _on_backpack_picked)
	door.connect("body_entered", _on_door_try)
	computer.connect("body_entered", _on_computer_touched)
	tutorial_btn.connect("used", _on_tutorial_btn_used)


func _on_tutorial_btn_used() -> void:
	var players = get_tree().get_nodes_in_group("players")
	for i in range(players.size()):
		players[i].position = Vector2(132 + 20 * i, 142)


func _on_backpack_picked(by:Node) -> void:
	backpack.queue_free()
	door.open()


func _on_door_try(by:Node) -> void:
	if backpack == null:
		get_tree().exit()


func _on_computer_touched(by:Node) -> void:
	var players = get_tree().get_nodes_in_group("players")
	for i in range(players.size()):
		players[i].position = Vector2(40 + 20 * i, $Objects/TutorialDoor.position.y)
	set_deferred("monitoring", false)

extends Level


# Nodes
@onready var tutorial_btn : LevelButton = $Entities/TutorialButton
@onready var backpack = $Entities/Backpack
@onready var exit_door = $Entities/ExitDoor
# Vars
const NEXT_SCENE : PackedScene = preload("res://scenes/levels/level2/level2.tscn")
var backpacked : bool = false


func _ready() -> void:
	super()
	tutorial_btn.connect("activated", _on_tutorial_completed)
	backpack.connect("body_entered", _on_backpack_touched)
	exit_door.connect("body_entered", _on_exit_touched)


func _on_tutorial_completed() -> void:
	spawn_players()
	$Entities/ComputerTeleporter.queue_free()


func _on_backpack_touched(body:Node2D) -> void:
	backpack.queue_free()
	backpacked = true
	exit_door.open()


func _on_exit_touched(body:Node2D) -> void:
	if backpacked:
		emit_signal("completed", NEXT_SCENE)

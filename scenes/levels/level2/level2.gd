extends Level


@onready var ticket : Item = $Entities/BusTicket
@onready var worker : NPC = $Entities/Worker
@onready var exit : Area2D = $Entities/Exit
# Vars
var ticket_recharged : bool = false


func _ready() -> void:
	super()
	ticket.connect("body_entered", _on_ticket_collected)
	worker.connect("dialoged", _on_worker_dialog)
	exit.connect("body_entered", _on_exit_touched)


func _on_ticket_collected(body:Node2D) -> void:
	if body is Player:
		ticket.queue_free()


func _on_worker_dialog() -> void:
	if not ticket:
		ticket_recharged = true
		print(1)


func _on_exit_touched(body:Node2D) -> void:
	if body is Player and ticket_recharged:
		emit_signal("completed", load("res://scenes/levels/level3/level3.tscn"))

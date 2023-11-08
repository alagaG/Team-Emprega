extends Level


# Nodes
@onready var teacher : CustomNPC = $Entities/Teacher
@onready var librarian : CustomNPC = $Entities/Librarian
@onready var books : Array = [ $Entities/Book0, $Entities/Book1, $Entities/Book2, $Entities/Book3, $Entities/Book4, $Entities/Book5 ]
@onready var computer_btn : LevelButton = $Entities/LevelButton
@onready var computers : Computers = $Entities/Computers
# Vars
var teacher_dialog : int = 0
var mission : int = 0


func _ready() -> void:
	super()
	teacher.connect("dialoged", _on_teacher_dialog)
	librarian.connect("dialoged", _on_librarian_dialog)
	for book in books:
		book.connect("touched", _on_book_touched)
	computer_btn.connect("activated", _activate_computers)
	computers.connect("activated", _on_computers_touched)


func _on_teacher_dialog() -> void:
	match mission:
		0:
			match teacher_dialog:
				0: teacher.set_dialog("Então você quer ajuda com seu currículo?")
				1: teacher.set_dialog("Tudo bem.")
				2: teacher.set_dialog("Comece pesquisando na biblioteca e faça um no 1° andar.")
				_: teacher.set_dialog("Volte quando tiver terminado.")
			teacher_dialog += 1
		1:
			match teacher_dialog:
				0: teacher.set_dialog("a")
				1: teacher.set_dialog("Tudo bem.")
				2: teacher.set_dialog("Comece pesquisando na biblioteca e faça um no 1° andar.")
				_: teacher.set_dialog("Volte quando tiver terminado.")
			if teacher_dialog == 5:
				teacher_dialog = 0
			else:
				teacher_dialog += 1


func _on_librarian_dialog() -> void:
	if mission == 0 and teacher_dialog > 2:
		librarian.set_dialog("Fique à vontade para pesquisar")
		for book in books:
			if book != null: 
				book.visible = true
	else:
		librarian.set_dialog("Fale baixo")


func _on_book_touched(item:Item) -> void:
	if item.visible: 
		item.queue_free()


func _activate_computers() -> void:
	computers.activate()


func _on_computers_touched() -> void:
	if mission == 0 and teacher_dialog > 2:
		mission = 1
		computers.activate()
		emit_signal("completed", load("res://scenes/levels/level3/questions.tscn"))

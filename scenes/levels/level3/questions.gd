extends Level


@export var btn_a : Button
@export var btn_b : Button
@export var btn_c : Button
@export var answer : PanelContainer
@export var answer_label : Label
@export var question : PanelContainer
@export var question_label : Label


func _ready() -> void:
	if btn_a: btn_a.connect("pressed", _answer.bind("A"))
	if btn_b: btn_b.connect("pressed", _answer.bind("B"))
	if btn_c: btn_c.connect("pressed", _answer.bind("C"))


func _answer(option:String) -> void:
	if not btn_c.visible: return
	answer_label.text = option
	answer.visible = true
	
	if option == "B":
		question_label.text = "Reposta Certa!\nÉ importante contar suas\n fraquezas e que enfrenta elas."
		question.size = Vector2.ZERO
		btn_a.visible = false
		btn_b.visible = false
		btn_c.visible = false
		await get_tree().create_timer(5).timeout
		emit_signal("completed", load("res://scenes/levels/level4/level4.tscn"))

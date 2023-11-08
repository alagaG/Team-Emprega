extends Node


@export var ceo_speak0 : Label
@export var ceo_speak1 : Label
@export var ceo_speak2 : Label

@export var extrovert_round_0 : HBoxContainer
@export var extrovert_round_1 : HBoxContainer
@export var introvert_round_0 : HBoxContainer
@export var introvert_round_1 : HBoxContainer

@export var label : Label


const correct_goals = [ 
	preload("res://resources/textures/fase4/goal0.png"),
	preload("res://resources/textures/fase4/goal1.png"),
	preload("res://resources/textures/fase4/goal2.png"),
	preload("res://resources/textures/fase4/goal3.png") 
	]
var current_round : HBoxContainer


func _ready() -> void:
	for goal in extrovert_round_0.get_children():
		goal.connect("pressed", _round_answer.bind(extrovert_round_0, goal))
	for goal in extrovert_round_1.get_children():
		goal.connect("pressed", _round_answer.bind(extrovert_round_1, goal))
	for goal in introvert_round_0.get_children():
		goal.connect("pressed", _round_answer.bind(introvert_round_0, goal))
	for goal in introvert_round_1.get_children():
		goal.connect("pressed", _round_answer.bind(introvert_round_1, goal))
	await get_tree().create_timer(2.0).timeout
	ceo_speak0.visible = false
	next_round()


func next_round() -> void:
	if current_round == null:
		current_round = extrovert_round_0
		extrovert_round_0.visible = true
	elif current_round == extrovert_round_0:
		current_round = introvert_round_0
		introvert_round_0.visible = true
	elif current_round == introvert_round_0:
		current_round = extrovert_round_1
		extrovert_round_1.visible = true
	elif current_round == extrovert_round_1:
		current_round = introvert_round_1
		introvert_round_1.visible = true
	elif current_round == introvert_round_1:
		end()


func end() -> void:
	label.visible = true
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scenes/levels/level4/entrevista3.tscn")


func _round_answer(round:HBoxContainer, goal:TextureButton) -> void:
	if goal.texture_normal in correct_goals:
		round.visible = false
		ceo_speak1.visible = true
		await get_tree().create_timer(1).timeout
		ceo_speak1.visible = false
		next_round()
	else:
		ceo_speak2.visible = true
		await get_tree().create_timer(1).timeout
		ceo_speak2.visible = false

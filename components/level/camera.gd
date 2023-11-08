extends Camera2D


var players = []


func _process(delta: float) -> void:
	players = get_tree().get_nodes_in_group("players")
	if players.size() == 2:
		var player_one : Player = players[0]
		var player_two : Player = players[1]
		var difference : Vector2 = player_two.position - player_one.position
		
		position = player_one.position + difference / 2

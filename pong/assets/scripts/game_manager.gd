extends Node

var player_one_score : int = 0
var player_two_score : int = 0

var ball_scene : PackedScene = preload("res://assets/scenes/ball.tscn")
var ball : Node = null

func _ready() -> void:
	ball_initial_setup()
	players_initial_setup()
	pass

func _process(_delta: float) -> void:
	# Se nao houver bolas na cena
	
	if not is_instance_valid(ball):
		ball_initial_setup()
	game_over_checker()


func ball_initial_setup():
	if is_instance_valid(ball):
		ball.queue_free()
	ball = ball_scene.instantiate()
	add_child(ball)
	
	# start position
	ball.position = get_viewport().size / 2
	
	
func players_initial_setup():
	# start position
	var player = get_parent().get_node("Player")
	player.position.x = (get_viewport().size.x / 20)
	player.position.y = (get_viewport().size.y / 2)
	
	var enemy = get_parent().get_node("Enemy")
	enemy.position.x = (get_viewport().size.x / 20) * 19
	enemy.position.y = (get_viewport().size.y / 2)
	
func score_player_1(points : int):
	player_one_score += points
	
	var label : Label = get_parent().get_node("GameUI/HBoxContainer/ScorePlayer1/Score1")
	label.text = "Jogador 1: " + str(player_one_score)
	
	var score : AudioStreamPlayer = get_parent().get_node("Score")
	score.play()
	
	if is_instance_valid(ball):
		ball.queue_free()
	ball_initial_setup()

func score_player_2(points : int):
	player_two_score += points
	
	var label : Label = get_parent().get_node("GameUI/HBoxContainer/ScorePlayer2/Score2")
	label.text = "Jogador 2: " + str(player_two_score)
	
	var score : AudioStreamPlayer = get_parent().get_node("Score")
	score.play()
	
	if is_instance_valid(ball):
		ball.queue_free()
	ball_initial_setup()
	
func game_over_checker():
	if player_one_score >= 5 or player_two_score >= 5:
		var game_over = preload("res://assets/scenes/game_over.tscn")
		get_tree().change_scene_to_packed(game_over)
	pass

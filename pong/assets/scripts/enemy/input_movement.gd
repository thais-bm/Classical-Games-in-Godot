extends Node

var direction : Vector2
var is_stopped : bool = true

var computer : bool = true

signal movement_inputed
signal stopped
signal computer_moved


# Recevies input and sends a vector to 'move func' in movement.gd
func _process(delta: float) -> void:
	var direction = Vector2.ZERO
	
	computer_enemy(delta)
	"""
	elif Input.is_action_pressed("enemy_up"):
		direction = Vector2.UP
	elif Input.is_action_pressed("enemy_down"):
		direction = Vector2.DOWN
		
	if direction != Vector2.ZERO:
		is_stopped = false
		movement_inputed.emit(direction)
	elif direction == Vector2.ZERO and !is_stopped:
		is_stopped = true
		stopped.emit()
	 """
		
func computer_enemy(delta):
	var direction = Vector2.ZERO
	var group_name = "bola"
	var bolas = get_tree().get_nodes_in_group(group_name)
	
	for bola in bolas:
		print("Posição global da bola:", bola.global_position)
		if bola.global_position.y < get_parent().global_position.y - 30:
			direction = Vector2.UP
		elif bola.global_position.y > get_parent().global_position.y + 30:
			direction = Vector2.DOWN
		break # Saia do loop após encontrar a primeira bola
		
	if direction != Vector2.ZERO:
		movement_inputed.emit(direction)
		is_stopped = false
	elif direction == Vector2.ZERO:
		var rng = RandomNumberGenerator.new() 
		rng.randf_range(-1, 1) 
		direction = Vector2(0, rng.randf_range(-1, 1)) + direction
		var velocidade = 200 * delta
		get_parent().global_position += direction * velocidade
		


	
	
	
	
	

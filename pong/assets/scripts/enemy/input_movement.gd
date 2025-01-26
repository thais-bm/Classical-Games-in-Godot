extends Node

var direction : Vector2
var is_stopped : bool = true

signal movement_inputed
signal stopped


# Recevies input and sends a vector to 'move func' in movement.gd
func _process(delta: float) -> void:
	var direction = Vector2.ZERO
	if Input.is_action_pressed("enemy_up"):
		direction = Vector2.UP
	if Input.is_action_pressed("enemy_down"):
		direction = Vector2.DOWN
		
	if direction != Vector2.ZERO:
		is_stopped = false
		movement_inputed.emit(direction)
	elif direction == Vector2.ZERO and !is_stopped:
		is_stopped = true
		stopped.emit()
		

extends Node

# Initial setup
var INITIAL_POSITION : float
var speed : float = 10
var CONSTANT_VALUE : float = 50

signal moved

func _ready() -> void:
	INITIAL_POSITION = get_parent().position.x

func move(direction : Vector2):
	# Move signal
	if direction != Vector2.ZERO:
		moved.emit()
	
	# Movement Code
	get_parent().velocity = direction * speed * CONSTANT_VALUE
	get_parent().move_and_slide()
	
	# To make the pedal stay in place
	get_parent().position.x = INITIAL_POSITION
	
func computer_movement(direction : Vector2):
	print("entra aqui na moviment")
	get_parent().velocity = direction * 200
	get_parent().move_and_slide()
	
	# To make the pedal stay in place
	get_parent().position.x = INITIAL_POSITION

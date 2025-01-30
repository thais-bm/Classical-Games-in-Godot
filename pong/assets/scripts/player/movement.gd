extends Node

# saves initial position
var INITIAL_POSITION : float

# Speed constants
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
	# We need vertical movement, not horizontal
	get_parent().position.x = INITIAL_POSITION

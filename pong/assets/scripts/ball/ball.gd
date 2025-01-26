extends RigidBody2D

# This is a ball
# Gravity scall -> ZERO
# Added Physics Material: Bounce 1


func _ready() -> void:
	# Start position
	position = get_viewport().size / 2
	
	# add a inicial boost
	apply_central_impulse(Vector2(-300, 0))

func _process(delta: float) -> void:
	
	pass

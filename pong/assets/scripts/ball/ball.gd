extends RigidBody2D

var base_speed: int = 300
signal collided
var has_played

# A bola do jogo Pong
# Escala da gravidade -> ZERO
# Adicionado Material Físico: Bounce 1

func _ready() -> void:
	# Adiciona um impulso inicial
	var direction = Vector2(1, 0).normalized()
	linear_velocity = direction * base_speed


func _on_body_entered(body: Node) -> void:
	if not has_played:
		print("aqui entra")
		var bounce: AudioStreamPlayer = get_node("Bounce")
		bounce.play()
		has_played = true

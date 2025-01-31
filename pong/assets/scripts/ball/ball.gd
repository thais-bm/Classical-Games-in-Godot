extends RigidBody2D

var base_speed: int = 300

# A bola do jogo Pong
# Escala da gravidade -> ZERO
# Adicionado Material Físico: Bounce 1

func _ready() -> void:
	# Adiciona um impulso inicial
	var direction = Vector2(1, 0).normalized()
	linear_velocity = direction * base_speed


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is StaticBody2D or body is CharacterBody2D:
		get_node("Bounce").play()

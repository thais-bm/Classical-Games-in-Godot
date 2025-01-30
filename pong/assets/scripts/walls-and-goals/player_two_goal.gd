extends Area2D

signal scored
var points : int = 1


func _on_body_entered(body: Node2D) -> void:
	# Se o corpo for um objeto rigido: a bola
	# printa e emite os pontos
	if body is RigidBody2D:
		print("bolinha passou aqui 22222")
		scored.emit(points)

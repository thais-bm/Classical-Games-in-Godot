extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_novo_jogo_pressed() -> void:
	var scene : PackedScene = preload("res://assets/scenes/main.tscn")
	get_tree().change_scene_to_packed(scene)

func _on_sair_pressed() -> void:
	get_tree().quit()

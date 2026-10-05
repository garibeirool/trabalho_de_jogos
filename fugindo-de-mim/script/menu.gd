extends Control

func _on_iniciar_pressed() -> void:
	pass 

func _on_sair_pressed() -> void:
	get_tree().quit()

func _on_creditos_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/creditos.tscn")

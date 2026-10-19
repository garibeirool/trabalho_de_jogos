extends CharacterBody2D

var velocidade = 100.0
var direcao = 1


func _physics_process(delta):
	velocity.x = velocidade * direcao

	move_and_slide()

	if is_on_wall():
		direcao *= -1


func _on_area_dano_body_entered(body):
	if body.name == $player:
		body.perder_vida()

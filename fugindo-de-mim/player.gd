extends CharacterBody2D

var velocidade = 200.0
var forca_pulo = -400.0
var gravidade = 1000.0
var vidas = 3
var pode_perder_vida = true
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravidade * delta
	if Input.is_action_pressed("esquerda"):
		velocity.x = -velocidade
	elif Input.is_action_pressed("direita"):
		velocity.x = velocidade
	else:
		velocity.x = 0
	if Input.is_action_just_pressed("pulo") and is_on_floor():
		velocity.y = forca_pulo

	move_and_slide()

func perder_vida():
	if not pode_perder_vida:
		return
	pode_perder_vida = false

	vidas -= 1

	if vidas <= 0:
		get_tree().change_scene_to_file("res://cenas/Derrota.tscn")
	else:
		global_position = Vector2(100, 300)
		
		await get_tree().create_timer(1.0).timeout
		
		pode_perder_vida = true

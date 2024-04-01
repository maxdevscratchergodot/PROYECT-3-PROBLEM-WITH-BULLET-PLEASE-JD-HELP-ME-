extends CharacterBody2D

var velocidad = 210
var salto_velocidad = -3500  
var gravedad = 5000  
var friccion = 0.60  
var en_suelo = false 

var velocidad_actual = Vector2()

func _physics_process(delta):
	var direccion = Vector2()

	if Input.is_action_pressed("ui_right"):
		$"HUMANO SPRITE".flip_h = false 
		direccion.x += 1
		$"HUMANO SPRITE/ANIMACION".play("HUMANO ANIMACION")
		
	if Input.is_action_pressed("ui_left"):
		$"HUMANO SPRITE".flip_h = true
		direccion.x -= 1 
		$"HUMANO SPRITE/ANIMACION".play("HUMANO ANIMACION")
	
	velocidad_actual = velocidad_actual * friccion
	
	
	if Input.is_action_pressed("espacio"):
		if not (Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left")):
			$"HUMANO SPRITE/ANIMACION".play("HUMANO ATAQUE ANIMACION")
	
	if not en_suelo:
		velocidad_actual.y += gravedad * delta
		
	var nueva_posicion = position + velocidad_actual * delta
	if not is_colliding(nueva_posicion):
		position = nueva_posicion
	en_suelo = is_on_floor()

	if Input.is_action_pressed("ui_up") and en_suelo:
		$"HUMANO SPRITE/ANIMACION".play("HUMANO SALTO ANIMACION")
		velocidad_actual.y = salto_velocidad
		
	velocidad_actual += direccion * velocidad
	
	move_and_slide()

func is_colliding(posicion_nueva: Vector2) -> bool:
	return false


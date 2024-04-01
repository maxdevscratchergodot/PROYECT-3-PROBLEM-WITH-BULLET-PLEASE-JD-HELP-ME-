extends Node2D

var velocidad_bala = 500 # Velocidad a la que se moverá la bala
var direccion = 1 # 1 para derecha, -1 para izquierda

func _process(delta):
	if Input.is_action_pressed("espacio"):
		if not (Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left")):
			var bala = get_node("MUNDO/BALA")
			var humano = get_node("MUNDO/HUMANO")
			bala.position = humano.position
			bala.direccion = direccion
			add_child(bala)

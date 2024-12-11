class_name FuentePresion
extends Conexion

func set_presion(nueva_presion : float):
	super(nueva_presion)
	$valor.text = str(presion)

func modificar_masa(masaAVariar: float) -> void:
	pass

func conectar(puerto: PuertoValvula) -> void:
	puertoInicio = puerto
	puerto.conexionConectada = self
	
	global_position = puerto.global_position
	enConstrucion = false
	
	$Input.visible = true
	$Input.grab_focus()

func _process(_delta: float) -> void:
	
	if enConstrucion: global_position = get_global_mouse_position()

func _on_input_text_submitted(new_text: String) -> void:
	
	if new_text.is_valid_float():
		
		presion = float(new_text)
		
		print( "Fuente de presion seteada a: ", presion)
		$Input.visible = false
		$valor.visible = true
		finalizar_conexion()

func actualizar():
	puertoInicio.presion = presion
	puertoInicio.masa = 10

class_name FuentePresion
extends Conexion

func set_presion(nueva_presion : float):
	super(nueva_presion)
	$valor.text = str(presion)

func modificar_masa(masaAVariar: float) -> void:
	pass

func conectar(puerto: PuertoDeConexion = null) -> void:
	
	puerto.conexion2 = self
	
	global_position = puerto.global_position
	instalando = false #indico que ya lo coloque para que no se mueva
	
	$Input.visible = true
	$Input.grab_focus()

func _process(_delta: float) -> void:
	
	if instalando: global_position = get_global_mouse_position()

func _on_input_text_submitted(new_text: String) -> void:
	
	if new_text.is_valid_float():
		
		presion = float(new_text)
		
		print( "Fuente de presion seteada a: ", presion)
		$Input.visible = false
		$valor.visible = true
		finalizar_instalacion()
"""
func actualizar():
	puertoInicio.presion = presion
	puertoInicio.masa = 10
"""

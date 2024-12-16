class_name Deposito
extends ElementoFijo

func set_presion(nueva_presion : float) -> void:
	presion = nueva_presion
	$Presion.text = "P: " + "%.2f" % presion

func set_volumen(nuevo_volumen : float) -> void:
	volumen = nuevo_volumen
	$Volumen.text = "V: " + str(volumen)

func setear_elemento(event: InputEvent) -> void:
	
	if instalando and event is InputEventMouseButton and event.pressed:
		
		instalando = false
		$Input.visible = true
		$Input.grab_focus()

func _on_input_text_submitted(new_text: String) -> void:

	if new_text.is_valid_float():
		
		volumen = float(new_text)
		
		print( "Deposito seteada a: ", volumen)
		$Input.visible = false
		
		finalizar_instalacion()

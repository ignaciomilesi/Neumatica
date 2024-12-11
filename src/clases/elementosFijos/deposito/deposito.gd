class_name Deposito
extends ElementoFijo

var presion : float = 0 : 
	set(valor):
		presion = valor
		$Presion.text = "P: " + str(presion)

var volumen : float = 0 : 
	set(valor):
		volumen = valor
		$Volumen.text = "V: " + str(volumen)

var masa : float = 0

func colocar_elemento(event: InputEvent) -> void:
	
	if enColocacion and event is InputEventMouseButton and event.pressed:
		
		enColocacion = false
		$Input.visible = true
		$Input.grab_focus()


func _on_input_text_submitted(new_text: String) -> void:

	if new_text.is_valid_float():
		
		volumen = float(new_text)
		
		print( "Deposito seteada a: ", volumen)
		$Input.visible = false
		construcionFinalizada.emit()

func actualizar():
	var puertoConeccion : PuertoValvula = $"Puertos/1"
	
	var presionPuerto = puertoConeccion.conexionConectada.presion
	
	if presionPuerto > presion :
		
		puertoConeccion.conexionConectada.modificar_masa(-10)
		masa += 10
	
	elif presionPuerto < presion :
		
		puertoConeccion.conexionConectada.modificar_masa(10)
		masa += - 10
	
	presion = masa / volumen

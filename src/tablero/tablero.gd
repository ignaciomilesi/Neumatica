class_name Tablero
extends Node2D

const cañeria = preload("res://src/clases/conexiones/cañeria/cañeria.tscn")
const fuenteDePresion = preload("res://src/clases/conexiones/fuente de presion/fuente_presion.tscn")
const salidaAlExterior = preload("res://src/clases/conexiones/exterior/exterior.tscn")
const deposito = preload("res://src/clases/elementosFijos/deposito/deposito.tscn")
const valvula = preload("res://src/clases/elementosFijos/valvula/valvula.tscn")

var elementoEnConstruccion = null

var estadoActual = VariableGlobales.estados.IDLE

func finalizar_nueva_conexion():
	
	print("Conexion creada: ", elementoEnConstruccion)
	
	estadoActual = VariableGlobales.estados.IDLE
	
	$Camera2D/UI.reset_botones()
	
	get_tree().call_group("ElementoFijo", "habilitar_puertos_coneccion",false)
	
	elementoEnConstruccion.construcionFinalizada.disconnect(finalizar_nueva_conexion)
	elementoEnConstruccion = null

################ Manejo de señales ################

func _on_ui_nuevo_elemento(elemento: Variant) -> void:
	
	estadoActual = elemento
	
	if estadoActual == VariableGlobales.estados.CREANDO_CAÑERIA:
		
		print("Creando nueva cañeria")
		elementoEnConstruccion = cañeria.instantiate()
		$Conexiones.add_child(elementoEnConstruccion)
		
	elif estadoActual == VariableGlobales.estados.CREANDO_FUENTE_DE_PRESION:
		
		print("Creando nueva fuente de presion")
		elementoEnConstruccion = fuenteDePresion.instantiate()
		$Conexiones.add_child(elementoEnConstruccion)
	
	elif estadoActual == VariableGlobales.estados.CREANDO_EXTERIOR:
		
		print("Creando salida al exterior")
		elementoEnConstruccion = salidaAlExterior.instantiate()
		$Conexiones.add_child(elementoEnConstruccion)
	
	elif estadoActual == VariableGlobales.estados.CREANDO_DEPOSITO:
		
		print("Creando deposito")
		elementoEnConstruccion = deposito.instantiate()
		$ElementosFijos.add_child(elementoEnConstruccion)
	
	elif estadoActual == VariableGlobales.estados.CREANDO_VALVULA:
		
		print("Creando Valvula")
		elementoEnConstruccion = valvula.instantiate()
		$ElementosFijos.add_child(elementoEnConstruccion)
	
	elementoEnConstruccion.iniciar()
	elementoEnConstruccion.construcionFinalizada.connect(finalizar_nueva_conexion)


func _on_ui_cancelar_nuevo_elemento() -> void:
	print("Creacion cancelada")
	
	if elementoEnConstruccion != null:
		elementoEnConstruccion.queue_free()
		elementoEnConstruccion = null
		
	get_tree().call_group("ElementoFijo", "habilitar_puertos_coneccion",false)
	estadoActual = VariableGlobales.estados.IDLE


func _on_timer_timeout() -> void:
	if estadoActual == VariableGlobales.estados.ACTUALIZANDO:
		get_tree().call_group("actualizable", "actualizar")


func _on_ui_actualizar() -> void:
	estadoActual = VariableGlobales.estados.ACTUALIZANDO
	print("------------------------Corriendo------------------------")


func _on_ui_detener() -> void:
	estadoActual = VariableGlobales.estados.IDLE
	print("------------------------Detenido------------------------")

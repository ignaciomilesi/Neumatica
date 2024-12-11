class_name Conexion
extends Node2D

var puertoInicio : PuertoValvula = null
var puertoFin : PuertoValvula = null

var enConstrucion : bool = false
signal construcionFinalizada

var presion : float = 0 : set = set_presion
var masa : float = 0

func set_presion(nueva_presion : float) -> void:
	presion = nueva_presion

func modificar_masa(masaAVariar : float) -> void:
	masa += masaAVariar
	if masa < 0 : masa = 0
	presion = masa * 0.10

func iniciar() -> void:
	
	enConstrucion = true
	
	# habilito los puertos de la valvula
	get_tree().call_group("ElementoFijo", "habilitar_puertos_coneccion",true)
	
	# conecto la señal del puerto seleccionado de la valvula al elemento
	for elemento : ElementoFijo in get_tree().get_nodes_in_group("ElementoFijo"):
		elemento.puerto_selecionado.connect(conectar)

# manejara lo que ocurrira al conectar a un puerto de valvula
func conectar(puerto: PuertoValvula):
	pass

func finalizar_conexion() -> void:
	enConstrucion = false
	
	get_tree().call_group("ElementoFijo", "habilitar_puertos_coneccion",false)
	# conecto la señal del puerto seleccionado de la valvula al elemento
	for elemento : ElementoFijo in get_tree().get_nodes_in_group("ElementoFijo"):
		elemento.puerto_selecionado.disconnect(conectar)
		
	construcionFinalizada.emit()

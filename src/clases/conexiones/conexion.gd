class_name Conexion
extends Elemento

# var puertoInicio : PuertoDeConexion = null
# var puertoFin : PuertoDeConexion = null

var presion : float = 0 : set = set_presion
var masa : float = 0

func set_presion(nueva_presion : float) -> void:
	presion = nueva_presion

func modificar_masa(masaAVariar : float) -> void:
	masa += masaAVariar
	if masa < 0 : masa = 0
	presion = masa * 0.10

func iniciar_instalacion() -> void:
	
	super()
	
	# habilito los puertos de la valvula
	get_tree().call_group("puertoDeConexion", "habilitar_coneccion",true)
	
	# conecto la señal para seleccionar puerto
	for puerto : PuertoDeConexion in get_tree().get_nodes_in_group("puertoDeConexion"):
		puerto.puertoSeleccionado.connect(conectar)



# manejara lo que ocurrira al conectar a un puerto de valvula
func conectar(puerto: PuertoDeConexion):
	pass


func finalizar_instalacion() -> void:
	
	get_tree().call_group("puertoDeConexion", "habilitar_coneccion",false)
	# conecto la señal del puerto seleccionado de la valvula al elemento
	for puerto : PuertoDeConexion in get_tree().get_nodes_in_group("puertoDeConexion"):
		puerto.puertoSeleccionado.disconnect(conectar)
	
	super()

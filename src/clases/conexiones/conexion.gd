class_name Conexion
extends Elemento




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

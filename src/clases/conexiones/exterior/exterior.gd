class_name Exterior
extends Conexion

func conectar(puerto: PuertoDeConexion = null) -> void:

	puerto.conexion2 = self
	
	global_position = puerto.global_position
	presion = 0
	
	finalizar_instalacion()

func _process(_delta: float) -> void:
	
	if instalando: global_position = get_global_mouse_position()

class_name Exterior
extends Conexion

func conectar(puerto: PuertoValvula) -> void:
	puertoInicio = puerto
	puerto.conexionConectada = self
	
	global_position = puerto.global_position
	presion = 0
	
	finalizar_conexion()

func _process(_delta: float) -> void:
	
	if enConstrucion: global_position = get_global_mouse_position()

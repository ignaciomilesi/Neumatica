class_name Valvula
extends ElementoFijo

enum estados { REPOSO, ACTIVADA }
var estadoActual = estados.REPOSO

func activar_valvula():
	$Sprite2D.position.x = 148
	estadoActual = estados.ACTIVADA

func desactivar_valvula():
	$Sprite2D.position.x = 0
	estadoActual = estados.REPOSO

func conectarPuertos(puertoInicio : PuertoDeConexion, puertoFin : PuertoDeConexion):
	
	var presionPuerto1 = puertoInicio.conexionConectada.presion
	var presionPuerto2 = puertoFin.conexionConectada.presion
	
	if presionPuerto1 > presionPuerto2 :
		
		puertoInicio.conexionConectada.modificar_masa(-10)
		puertoFin.conexionConectada.modificar_masa(10)
		
	elif presionPuerto1 < presionPuerto2 :
		
		puertoInicio.conexionConectada.modificar_masa(10)
		puertoFin.conexionConectada.modificar_masa(-10)

func actualizar():
	
	if estadoActual == estados.REPOSO :
		conectarPuertos($"Puertos/2", $"Puertos/3")
	
	if estadoActual == estados.ACTIVADA :
		conectarPuertos($"Puertos/1", $"Puertos/2")

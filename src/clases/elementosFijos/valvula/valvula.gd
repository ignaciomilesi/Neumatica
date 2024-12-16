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

func actualizar():
	
	var puertoDeCalculo : PuertoDeConexion = $Puertos/deCalculo
	var puertoInicio : PuertoDeConexion
	var puertoFin : PuertoDeConexion
	
	if estadoActual == estados.REPOSO :
		puertoInicio = $"Puertos/deCalculo/2"
		puertoFin = $"Puertos/deCalculo/3"
	
	if estadoActual == estados.ACTIVADA :
		puertoInicio = $"Puertos/deCalculo/1"
		puertoFin = $"Puertos/deCalculo/2"
		
	puertoDeCalculo.conexion1 = puertoInicio.conexion2
	puertoDeCalculo.conexion2 = puertoFin.conexion2

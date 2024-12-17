class_name Elemento
extends Node2D

var instalando : bool
signal instalacionFinalizada

var presion : float = 0 : set = set_presion
var volumen : float = 5 : set = set_volumen
var masa : float = 0

func set_presion(nueva_presion : float) -> void:
	presion = nueva_presion

func set_volumen(nuevo_volumen : float) -> void:
	volumen = nuevo_volumen

func modificar_masa(diferenciaDePresion : float) -> void:
	if abs(diferenciaDePresion) < 0.3 :
		presion += diferenciaDePresion
	else:
		masa += 2.5 * diferenciaDePresion
		if masa < 0 : masa = 0
		presion = masa / volumen


func iniciar_instalacion()-> void:
	instalando = true

func finalizar_instalacion() -> void:
	instalando = false
	instalacionFinalizada.emit()

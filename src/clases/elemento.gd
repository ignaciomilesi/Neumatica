class_name Elemento
extends Node2D

var instalando : bool
signal instalacionFinalizada

func iniciar_instalacion()-> void:
	instalando = true

func finalizar_instalacion() -> void:
	instalando = false
	instalacionFinalizada.emit()

class_name PuertoValvula
extends Area2D

var presion : float = 0
var masa : float = 0

signal puerto_seleccionado(puerto : PuertoValvula)

var show_punto : bool = false

var conexionConectada : Conexion

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	# si me clickean emito la señal
	if event is InputEventMouseButton and event.pressed:
		puerto_seleccionado.emit(self)

func _draw() -> void:
	if show_punto:
		draw_circle(Vector2(0, 0), 10, Color.RED)

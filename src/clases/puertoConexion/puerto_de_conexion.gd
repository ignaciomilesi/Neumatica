class_name PuertoDeConexion
extends Area2D

signal puertoSeleccionado(puerto: PuertoDeConexion)

var show_punto : bool = false

var conexion1 : Node2D
var conexion2 : Node2D

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	# si me clickean emito la señal
	if event is InputEventMouseButton and event.pressed:
		puertoSeleccionado.emit(self)

func _draw() -> void:
	if show_punto:
		draw_circle(Vector2(0, 0), 10, Color.RED)


func habilitar_coneccion(habilito : bool) -> void:

	# muestro/oculto los puntos
	show_punto = habilito
	queue_redraw()
	
	# cambio el cursor
	var cursor : Control = $Cursor
	if habilito:
		cursor.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	else:
		cursor.mouse_default_cursor_shape = Control.CURSOR_ARROW
	
	# los hago o no pickeables
	input_pickable = habilito

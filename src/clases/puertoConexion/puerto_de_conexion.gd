class_name PuertoDeConexion
extends Area2D

signal puertoSeleccionado(puerto: PuertoDeConexion)

var show_punto : bool = false

@onready var conexion1 : Elemento = owner
var conexion2 : Elemento

# Usado para indicar la naturaleza del puerto
# Puerto de Referencia solo sirve como marcador visual
# mientras que el Puerto de Cálculo es el que maneja la parte computacional.
# por defecto son de calulo
@export_enum("deReferencia", "deCalculo") var tipo: int = 1
# tambien indico si lo quiero mostrar o no al nodo, por defecto se muestra (y es pickeable)
@export var oculto : bool = false

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	# si me clickean emito la señal
	if event is InputEventMouseButton and event.pressed:
		puertoSeleccionado.emit(self)

func _draw() -> void:
	if show_punto: draw_circle(Vector2(0, 0), 10, Color.RED)


func habilitar_coneccion(habilito : bool) -> void:
	
	# si es un puerto oculto no lo muestro
	if oculto : return
	
	# si busco habilitar y el puerto esta ocupado por ambos lados, no lo habilito
	if habilito and conexion1 != null and conexion2 != null : return
	
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

func actualizar() -> void:
	# si es de referencia, no actualizo nada
	if tipo == 0 : return
	
	# agregamos masa al elemento de menor presion y le sacamos al de mayor
	# si son iguales no se hace nada
	
	conexion1.modificar_masa(conexion2.presion - conexion1.presion)
	conexion2.modificar_masa(conexion1.presion - conexion2.presion)
	

	

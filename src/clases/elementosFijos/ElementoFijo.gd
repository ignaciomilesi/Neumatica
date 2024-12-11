class_name ElementoFijo
extends Node2D

var enColocacion : bool = false

signal construcionFinalizada
signal puerto_selecionado(puerto: PuertoValvula)

func iniciar():
	enColocacion = true
	# conecto la señal del area en donde puedo dejar los elementos
	var area : Control = get_tree().get_first_node_in_group("areaDeColocacion")
	area.gui_input.connect(colocar_elemento)

func _process(_delta: float) -> void:
	
	if enColocacion:
		global_position = get_global_mouse_position()

func colocar_elemento(event: InputEvent) -> void:
	
	if enColocacion and event is InputEventMouseButton and event.pressed:
		
		enColocacion = false
		construcionFinalizada.emit()

func habilitar_puertos_coneccion(habilito : bool) -> void:
	for puerto in $Puertos.get_children():
		# muestro/oculto los puntos
		puerto.show_punto = habilito
		puerto.queue_redraw()
		
		# cambio el cursor
		var cursor : Control = puerto.get_node("Cursor")
		if habilito:
			cursor.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		else:
			cursor.mouse_default_cursor_shape = Control.CURSOR_ARROW
		
		# los hago o no pickeables
		puerto.input_pickable = habilito

func _on__puerto_seleccionado(puerto: PuertoValvula) -> void:
	puerto_selecionado.emit(puerto)

class_name UI
extends CanvasLayer

signal nuevo_elemento(elemento)
signal cancelar_nuevo_elemento

signal actualizar
signal detener


func desabilitar_botones(botonQueSeMantieneVisible : Button):
	get_tree().call_group("boton_UI", "set_visible", false)
	# oculto todas las columnas
	for contenedor : BoxContainer in $HFlowContainer/Botones/Contenedor/Barra.get_children():
		contenedor.visible = false
	# muestro la del boton precionado
	botonQueSeMantieneVisible.get_parent().visible = true
	botonQueSeMantieneVisible.visible = true
	botonQueSeMantieneVisible.disabled = true
	$HFlowContainer/Botones/Contenedor/Cancelar.visible = true
	
func reset_botones():
	get_tree().call_group("boton_UI", "set_visible", true)
	get_tree().call_group("boton_UI", "set_disabled", false)
	
	for contenedor : BoxContainer in $HFlowContainer/Botones/Contenedor/Barra.get_children():
		contenedor.visible = true
		
	$HFlowContainer/Botones/Contenedor/Cancelar.visible = false


################ Manejo de señales ################

func _on_cañeria_pressed() -> void:
	nuevo_elemento.emit(VariableGlobales.estados.CREANDO_CAÑERIA)
	desabilitar_botones($HFlowContainer/Botones/Contenedor/Barra/ContenedorNuevaConexion/Cañeria)

func _on_fuente_presion_pressed() -> void:
	nuevo_elemento.emit(VariableGlobales.estados.CREANDO_FUENTE_DE_PRESION)
	desabilitar_botones($HFlowContainer/Botones/Contenedor/Barra/ContenedorNuevaConexion/FuentePresion)

func _on_exterior_pressed() -> void:
	nuevo_elemento.emit(VariableGlobales.estados.CREANDO_EXTERIOR)
	desabilitar_botones($HFlowContainer/Botones/Contenedor/Barra/ContenedorNuevaConexion/Exterior)

func _on_valvula_pressed() -> void:
	nuevo_elemento.emit(VariableGlobales.estados.CREANDO_VALVULA)
	desabilitar_botones($HFlowContainer/Botones/Contenedor/Barra/ContenedorNuevoElemento/Valvula)

func _on_deposito_pressed() -> void:
	nuevo_elemento.emit(VariableGlobales.estados.CREANDO_DEPOSITO)
	desabilitar_botones($HFlowContainer/Botones/Contenedor/Barra/ContenedorNuevoElemento/Deposito)

func _on_cancelar_pressed() -> void:
	cancelar_nuevo_elemento.emit()
	reset_botones()


func _on_actualizar_pressed() -> void:
	actualizar.emit()
	$HFlowContainer/area_de_colocacion/Actualizar.visible = false
	$HFlowContainer/area_de_colocacion/Detener.visible = true
	$HFlowContainer/Botones/Contenedor.visible = false


func _on_detener_pressed() -> void:
	detener.emit()
	$HFlowContainer/area_de_colocacion/Actualizar.visible = true
	$HFlowContainer/area_de_colocacion/Detener.visible = false
	$HFlowContainer/Botones/Contenedor.visible = true

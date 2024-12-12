class_name ElementoFijo
extends Elemento

@export var markersParaPuertos : Array[Marker2D]

func iniciar_instalacion()-> void:
	super()
	# conecto con el area donde puedo instalar el elemento
	var area : Control = get_tree().get_first_node_in_group("areaDeColocacion")
	area.gui_input.connect(setear_elemento)

func _process(_delta: float) -> void:
	
	if instalando: global_position = get_global_mouse_position()

func setear_elemento(event: InputEvent) -> void:
	
	if instalando and event is InputEventMouseButton and event.pressed:
		finalizar_instalacion()

func finalizar_instalacion() -> void:
	
		# desconecto con el area donde puedo instalar el elemento
		var area : Control = get_tree().get_first_node_in_group("areaDeColocacion")
		area.gui_input.disconnect(setear_elemento)
		
		super()

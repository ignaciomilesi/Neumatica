class_name Cañeria
extends Conexion

# lo uso para conocer si el puerto de selecionado comienza o finaliza la cañeria
var comenzada : bool = false 

func set_presion(nueva_presion : float):
	super(nueva_presion)
	for etiqueta : Label in $Line2d/Etiquetas.get_children():
		etiqueta.text = "%.2f" % presion


func conectar(puerto: PuertoDeConexion):
	
	print("Seleccionado: Puerto ", puerto.name)
	puerto.conexion2 = self
	
	if !comenzada:
		
		comenzada = true
		
		$Line2d.add_point(puerto.global_position)
		$Line2d.add_point(puerto.global_position)
		$Timer.start(0.2)
	
	else:
		$Line2d.set_point_position($Line2d.get_point_count()-1, puerto.global_position)
		
		mostrar_etiquetas()
		
		finalizar_instalacion()

func mostrar_etiquetas():
	# muestro las etiquetas de presion en la mitad de cada seccion
	var valor = $Line2d/valor
	valor.text = str(presion)
	valor.visible = true
	for i in range($Line2d.get_point_count()-1):
		valor.global_position = ($Line2d.get_point_position(i+1) + $Line2d.get_point_position(i)) / 2 - valor.size/2
		$Line2d/Etiquetas.add_child(valor.duplicate())
	valor.visible = false

func _process(_delta: float) -> void:
	
	if instalando and comenzada:
		
		# muevo el ultimo punto a la posicion del mouse
		$Line2d.set_point_position($Line2d.get_point_count()-1, get_global_mouse_position())
		
		# si hago click agrego un punto a la cañeria (el timer es para evitar el
		# doble punto al crear la cañeria)
		if Input.is_action_just_pressed("mouse_click") and $Timer.is_stopped():
			$Line2d.add_point(get_global_mouse_position())

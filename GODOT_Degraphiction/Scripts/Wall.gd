extends MeshInstance3D
	
func _process(delta):
	
	var mouse = get_viewport().get_mouse_position();
	var screen = get_viewport().get_visible_rect().size
	mouse.x /= screen.x
	mouse.y /= screen.y
	
	var shaderMat = get_surface_override_material(0)
	shaderMat.set_shader_parameter("mouse_position", mouse)
	
	# Toggle "Ultraviolet mode" when the user presses Enter
	if Input.is_action_just_released("ui_accept"):
		var current = shaderMat.get_shader_parameter("UVMode")
		shaderMat.set_shader_parameter("UVMode", 1 - current)
	

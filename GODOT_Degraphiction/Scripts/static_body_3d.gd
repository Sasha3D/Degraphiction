extends StaticBody3D

func activate_wall():
	print("Wall activated!")
	$WallScene.visible = true
	print("2D scene visibility: ", $WallScene.visible)  # Print the visibility status
	
	var camera = get_parent().get_parent().get_child(0).get_child(0)
	camera.set_input_enabled(false)
	# Reset custom cursor
	Input.set_custom_mouse_cursor(null)
	# Then set the default cursor shape
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	
func deactivate_wall():
	print("Wall deactivated!")
	$WallScene.visible = false
	print("2D scene visibility: ", $WallScene.visible)  # Print the visibility status
	
	var camera = get_parent().get_parent().get_child(0).get_child(0)
	camera.set_input_enabled(true)

func _process(delta):
	if Input.is_key_pressed(KEY_Q):
	# Deactivate the wall when the Q key is pressed
		deactivate_wall()

extends StaticBody3D

var wallscene
var mesh_3d
var camera

func _ready():
	#Hard coded values of nodes relative to static body 3d
	wallscene= get_parent().get_parent().get_child(2)
	wallscene= get_parent().get_parent().get_child(2)
	mesh_3d= wallscene.get_child(0).get_child(0)
	camera= get_parent().get_parent().get_child(0).get_child(0)

func activate_wall():
	wallscene.visible = true
	mesh_3d.visible= true
	camera.set_input_enabled(false)
	
	Input.set_custom_mouse_cursor(null)
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	
func deactivate_wall():
	wallscene.visible = false
	mesh_3d.visible= false
	camera.set_input_enabled(true)

func _process(delta):
	if Input.is_key_pressed(KEY_Q):
		deactivate_wall()

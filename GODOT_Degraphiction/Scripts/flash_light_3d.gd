extends SpotLight3D

# Sensitivity of the mouse movement.
var sensitivity = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	var camera = get_viewport().get_camera_3d()
	var target = camera.project_ray_normal(mouse_pos) * 1000
	
	look_at(target)

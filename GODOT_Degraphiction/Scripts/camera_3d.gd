extends Camera3D

#Initialize
var target_position = Vector3.ZERO
var input_enabled = true

var default_cursor = null
var open_eye_cursor = preload("res://Cursor/OpenEye.png") # Replace with the path to your custom cursor image
var closed_eye_cursor = preload("res://Cursor/ClosedEye.png") # Replace with the path to your custom cursor image


func _ready():
	get_parent().position = Vector3(-50.0, 0.0, 200.0) # Set the start position of the camera
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	Input.set_custom_mouse_cursor(open_eye_cursor)
	
	
func _input(event):
	if !input_enabled:
		return  # Ignore 3D interactions
	
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var from = project_ray_origin(event.position)
		var to = from + project_ray_normal(event.position) * 1000
		var space_state = get_world_3d().direct_space_state
		
		var parameters = PhysicsRayQueryParameters3D.create(from, to)
		parameters.collision_mask = 1  # Match the layer of the mesh
		
		var result = space_state.intersect_ray(parameters)
		
		#TODO: wall object
		if result and result.has("collider"):
			if result.collider is StaticBody3D:
				var wall = result.collider
				wall.activate_wall()  # Call the activation function on the wall

func set_input_enabled(enabled : bool):
	input_enabled = enabled

func _process(delta):
	if !input_enabled:
		return  # Ignore 3D interactions
	
# Perform a raycast every frame to check if the cursor is in front of a mesh
	var from = project_ray_origin(get_viewport().get_mouse_position())
	var to = from + project_ray_normal(get_viewport().get_mouse_position()) * 1000
	var space_state = get_world_3d().direct_space_state

	var parameters = PhysicsRayQueryParameters3D.new()
	parameters.from = from
	parameters.to = to
	parameters.collision_mask = 1  # Ensure this matches the collision layer of your meshes

	var result = space_state.intersect_ray(parameters)

	if result and result.has("collider"):
		if result.collider is StaticBody3D:
			Input.set_custom_mouse_cursor(closed_eye_cursor)
	else:
		Input.set_custom_mouse_cursor(open_eye_cursor)



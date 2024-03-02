extends Camera3D

var speed = 10  # Adjust this value to change the camera's movement speed
var rotation_speed = 2.0  # Adjust this value to change the camera's rotation speed

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)  # Capture the mouse cursor

func _process(delta):
	# Move the camera based on input
	var movement = Vector3.ZERO
	if Input.is_action_pressed("move_right"):
		movement.x += 1
	if Input.is_action_pressed("move_left"):
		movement.x -= 1
	if Input.is_action_pressed("move_backward"):
		movement.z += 1
	if Input.is_action_pressed("move_forward"):
		movement.z -= 1

	var rotation = 0.0
	if Input.is_action_pressed("rotate_left"):
		rotation += rotation_speed
	if Input.is_action_pressed("rotate_right"):
		rotation -= rotation_speed

	# Normalize the movement vector to prevent faster movement diagonally
	movement = movement.normalized()

	# Move the camera
	translate(movement * speed * delta)

	# Rotate the camera
	rotate_y(rotation * delta)

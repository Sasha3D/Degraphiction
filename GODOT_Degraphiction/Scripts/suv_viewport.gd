extends SubViewport

func _ready():
	# Set up the SubViewport
	self.size = Vector2(200, 200)  # Adjust the size as needed

	# Create and add a Camera to the SubViewport
	var camera = Camera3D.new()
	add_child(camera)
	camera.position = Vector3(0, 0, 5)  # Adjust the camera position as needed

	# Create and add a MeshInstance to the SubViewport
	var mesh_instance = get_child(0)

	# Create a ViewportTexture to capture the rendered SubViewport
	var viewport_texture = ViewportTexture.new()
	viewport_texture.viewport = self

	# Display the ViewportTexture in your 2D scene
	var sprite = Sprite2D.new()
	get_tree().root.add_child(sprite)  # Add the sprite to the root of the scene tree
	sprite.texture = viewport_texture
	sprite.position = Vector2(100, 100)  # Adjust the position of the sprite in your 2D scene

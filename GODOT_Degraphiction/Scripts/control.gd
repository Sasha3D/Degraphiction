extends Control
# Called when the node enters the scene tree for the first time.
func _ready():
	# Step 1: Create a SubViewportContainer
	var sub_viewport_container = SubViewportContainer.new()
	add_child(sub_viewport_container)
	sub_viewport_container.custom_minimum_size = Vector2(1000, 1000)  # Set the desired size

	# Step 2: Add a SubViewport to the SubViewportContainer
	var sub_viewport = SubViewport.new()
	sub_viewport_container.add_child(sub_viewport)
	sub_viewport.size = Vector2(1000, 1000)  # Set the size of the SubViewport

	# Add a Camera3D to the SubViewport
	var camera = Camera3D.new()
	sub_viewport.add_child(camera)
	camera.global_transform.origin = Vector3(0, 0, 55)

	# Step 3: Add a Sprite2D to display the SubViewport's texture
	var sprite = Sprite2D.new()
	add_child(sprite)
	sprite.texture = sub_viewport.get_texture()  # Get the SubViewport's texture
	sprite.position = Vector2(100, 100)  # Position the sprite in your 2D scene

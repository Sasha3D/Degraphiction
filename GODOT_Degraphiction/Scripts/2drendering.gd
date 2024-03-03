#extends Node2D
#
#
## Called when the node enters the scene tree for the first time.
#func _ready():
	#var mesh_instance_reference = get_parent().get_parent().get_child(1)
	#
	#var sub_viewport = SubViewport.new()
	#add_child(sub_viewport)
	#sub_viewport.size = Vector2(200, 200)  # Set the size of the SubViewport
#
	#var viewport_texture = ViewportTexture.new()
	#viewport_texture.viewport = sub_viewport
#
	#var sprite = Sprite2D.new()
	#add_child(sprite)
	#sprite.texture = viewport_texture
	#sprite.position = Vector2(100, 100)  # Set the position of the Sprite in the 2D scene
#
	#var camera = Camera3D.new()
	#sub_viewport.add_child(camera)
	#camera.translation = Vector3(0, 0, 5)  # Adjust the camera position as needed
#
	#var root_3d = Node3D.new()
	#sub_viewport.add_child(root_3d)
	#root_3d.add_child(mesh_instance_reference)
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

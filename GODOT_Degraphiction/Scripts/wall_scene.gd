extends Node2D

var uv_light_cursor = preload("res://Cursor/UVLight.png") # Replace with the path to your custom cursor image
var scrapper_cursor = preload("res://Cursor/Scrapper.png") # Replace with the path to your custom cursor image

var uv_light_mode= false
var scrapper_mode= false

func _ready():
	$".".visible= false
	var mesh_instance = get_parent().get_parent().get_child(1)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("press_w") and Input.is_action_just_pressed("press_e"):
		return
	elif Input.is_action_just_pressed("press_w"):
		Input.set_custom_mouse_cursor(uv_light_cursor)
		scrapper_mode= false
		uv_light_mode= true
	elif Input.is_action_just_pressed("press_e"):
		Input.set_custom_mouse_cursor(scrapper_cursor)
		uv_light_mode= false
		scrapper_mode= true
	


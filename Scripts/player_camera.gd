extends Camera3D

@export var mouse_delta: Vector2
@export var sens_modifier: float = 0.5
@export var zoom_sens_modifier: float = 0.1

var is_zoomed: bool = false

const base_fov: float = 75.0
const zoom_fov: float = 10.0

const min_rotation_x: float = deg_to_rad(-60)
const max_rotation_x: float = deg_to_rad(45)
const min_rotation_y: float = deg_to_rad(-90)
const max_rotation_y: float = deg_to_rad(90)
const RAY_LENGTH = 1000

@export var is_window_focused: bool = true

func _ready():
	rotation = Vector3(0, 0, 0)
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 2 and event.pressed == true:
			zoom()
	if event is InputEventMouseMotion:
		mouse_delta = event.relative
	if event.is_action_pressed("ui_cancel"):
		toggle_focus()


func _process(delta):
	if is_window_focused:
		rotation.x -= mouse_delta.y * delta * sens_modifier * (zoom_sens_modifier if is_zoomed else 1)
		rotation.x = clamp(rotation.x, min_rotation_x, max_rotation_x)
		rotation.y -= mouse_delta.x * delta * sens_modifier * (zoom_sens_modifier if is_zoomed else 1)
		rotation.y = clamp(rotation.y, min_rotation_y, max_rotation_y)
		# Stop moving the mouse
		mouse_delta = Vector2()


func _physics_process(_delta):
	if is_zoomed:
		fov = lerpf(fov, zoom_fov, 0.5)
	else:
		fov = lerpf(fov, base_fov, 0.5)
		

func zoom():
	is_zoomed = not is_zoomed
	#if is_zoomed:
		#fov = zoom_fov
	#else:
		#fov = base_fov
		


func toggle_focus():
	if is_window_focused:
		# Player using ui
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		# Player using camera
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	is_window_focused = not is_window_focused

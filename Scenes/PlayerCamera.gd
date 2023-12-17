extends Camera3D

@export var mouse_delta: Vector2
const min_rotation_x: float = deg_to_rad(-45)
const max_rotation_x: float = deg_to_rad(30)
const min_rotation_y: float = deg_to_rad(-30)
const max_rotation_y: float = deg_to_rad(30)

@export var is_window_focused: bool = true

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		mouse_delta = event.relative
	if event.is_action_pressed("ui_cancel"):
		toggle_focus()


func _process(delta):
	if is_window_focused:
		rotation.x -= mouse_delta.y * delta
		rotation.x = clamp(rotation.x, min_rotation_x, max_rotation_x)
		rotation.y -= mouse_delta.x * delta
		rotation.y = clamp(rotation.y, min_rotation_y, max_rotation_y)
		# Stop moving the mouse
		mouse_delta = Vector2()

func toggle_focus():
	if is_window_focused:
		# Player using ui
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		# Player using camera
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	is_window_focused = not is_window_focused

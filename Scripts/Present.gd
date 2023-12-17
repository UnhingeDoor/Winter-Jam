extends Node3D

signal inspection_entered
signal inspection_exited

@export var move_speed: float = 0.1

var is_getting_inspected: bool = false
var is_inspected: bool = false

@onready var player: Node3D = get_node("../Player")

func _process(_delta):
	#TODO Replace with button event
	if is_getting_inspected and Input.is_key_pressed(KEY_SPACE):
		inspection_exited.emit()
		is_getting_inspected = false
		is_inspected = true
	
	# Despawn the present when it's out of frame
	if position.x > player.position.x + 10:
		queue_free()


func _physics_process(_delta):
	# Stop the present if it's in front of the player, otherwise move
	if position.x > player.position.x and not is_inspected:
		if not is_getting_inspected:
			is_getting_inspected = true
			inspection_entered.emit()
	elif not GlobalVariables.inspection_in_progress:
		position.x += move_speed


func initialise(spawn_pos: Vector3):
	position = spawn_pos
	pass


func _on_inspection_entered():
	GlobalVariables.inspection_in_progress = true


func _on_inspection_exited():
	GlobalVariables.inspection_in_progress = false
	GlobalVariables.present_on_screen_count -= 1


func _on_control_panel_present_accepted():
	print_debug("Accepted")
	pass # Replace with function body.


func _on_control_panel_present_rejected():
	print_debug("Rejected")
	pass # Replace with function body.


func _on_control_panel_present_recycled():
	print_debug("Recycled")
	pass # Replace with function body.

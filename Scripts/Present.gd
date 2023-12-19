extends Node3D

signal inspection_entered
signal inspection_exited

@export var move_speed: float = 0.1
@export var isNice: bool = true

var is_getting_inspected: bool = false
var is_inspected: bool = false

@onready var player: Node3D = get_node("../Player")

func _ready():
	pass

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


func initialise(spawn_pos: Vector3 , obj):
	# Establish connectors to signals from player
	obj.present_accepted.connect(_on_player_present_accepted)
	obj.present_rejected.connect(_on_player_present_rejected)
	obj.present_recycled.connect(_on_player_present_recycled)
	position = spawn_pos
	
	# Get Nice/naughty
	isNice = true if randi_range(0, 1) == 0 else false
	if isNice:
		$MeshInstance3D.mesh.material.albedo_color = Color(0, 1, 0, 1)
	else:
		$MeshInstance3D.mesh.material.albedo_color = Color(1, 0, 0, 1)
	pass


func _on_inspection_entered():
	GlobalVariables.inspection_in_progress = true


func _on_inspection_exited():
	GlobalVariables.inspection_in_progress = false
	GlobalVariables.present_on_screen_count -= 1


func _on_player_present_accepted():
	if is_getting_inspected:
		inspection_exited.emit()
		is_getting_inspected = false
		is_inspected = true


func _on_player_present_rejected():
	if is_getting_inspected:
		inspection_exited.emit()
		is_getting_inspected = false
		is_inspected = true


func _on_player_present_recycled():
	if is_getting_inspected:
		inspection_exited.emit()
		is_getting_inspected = false
		is_inspected = true


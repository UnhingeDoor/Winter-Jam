extends Node3D

@export var move_speed: float = 0.1
@export var is_getting_inspected: bool = false

var inspected: bool = false

# Need to create player node
@onready var player: Node3D = get_node("../Player")

func _process(_delta):
	# Temp, will replace with button event
	if Input.is_key_pressed(KEY_SPACE):
		inspected = true

func _physics_process(_delta):
	# Stop the present if it's in front of the player, otherwise move
	if position.x > player.position.x and not inspected:
		pass
	else:
		position.x += move_speed

extends Node3D

signal inspection_entered
signal inspection_exited

@export var move_speed: float = 0.1
@export var isNice: bool = true

var is_getting_inspected: bool = false
var is_inspected: bool = false

var gift_box: Node3D

@onready var gift_boxes:= [$GiftType1, $GiftType2, $GiftType3]
@onready var player: Node3D = get_node("../Player")


func _ready():
	# Randomise physical properties
	gift_box = randomise_gift_shape()
	randomise_present_colours(gift_box)

func _process(_delta):
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
	
	## Get Nice/naughty
	if GlobalVariables.naughtyNice[GlobalVariables.presentDataIndex] == "Nice":
		GlobalVariables.NaughtNiceFixing = "Nice"
	if GlobalVariables.naughtyNice[GlobalVariables.presentDataIndex] == "Naughty":
		GlobalVariables.NaughtNiceFixing = "Naughty"
	
	GlobalVariables.presentDataIndex += 1
	
	GlobalVariables.updateTag = true;


func randomise_gift_shape() -> Node3D:
	var gift_type_idx = randi_range(0, 2) # 3 Types
	# Only show the right one
	for gift in gift_boxes:
		gift.hide()
	gift_boxes[gift_type_idx].show()
	return gift_boxes[gift_type_idx]


func randomise_present_colours(present) -> void:
	var ribbon_material = StandardMaterial3D.new()
	var box_material = StandardMaterial3D.new()
	
	var ribbon_hue = randf()
	var box_hue = ribbon_hue + 0.5 if ribbon_hue < 0.5 else ribbon_hue - 0.5
	
	ribbon_material.albedo_color = Color.from_hsv(ribbon_hue, 1, 1)
	box_material.albedo_color = Color.from_hsv(box_hue, 1, 1)
	
	present.get_child(0).mesh.surface_set_material(0, ribbon_material)
	present.get_child(0).mesh.surface_set_material(1, box_material)


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
		gift_box.hide()
		$Coal.show()
		inspection_exited.emit()
		is_getting_inspected = false
		is_inspected = true


func _on_player_present_recycled():
	if is_getting_inspected:
		inspection_exited.emit()
		is_getting_inspected = false
		is_inspected = true


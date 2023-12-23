extends Node3D

signal inspection_entered
signal inspection_exited

@export var move_speed: float = 0.1
@export var is_nice: bool = true

# The suitable action (button to press) given present variables
enum actions {ACCEPT, REJECT, RECYCLE}

@export var correct_action: actions
var action_taken: actions

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
	
<<<<<<< Updated upstream
	is_nice = randi_range(0, 1) # false, true
	correct_action = actions.ACCEPT if is_nice else actions.REJECT
=======
	is_nice = true if GlobalVariables.naughtyNice[GlobalVariables.presentDataIndex] == "Nice" else false
	if is_nice:
		correct_action = actions.ACCEPT
	else:
		correct_action = actions.REJECT
>>>>>>> Stashed changes
	position = spawn_pos
	
	GlobalVariables.presentDataIndex += 1

	
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


func compare_actions(correct, taken):
	if correct == taken:
		GlobalVariables.score += 1
	else:
		# emit incorrect action
		pass


func burn_present(present):
	GlobalVariables.fire = true
	await get_tree().create_timer(3).timeout
	GlobalVariables.fire = false
	present.hide()
	$Coal.show()


func finish_inspection():
	inspection_exited.emit()
	is_getting_inspected = false
	is_inspected = true


func _on_inspection_entered():
	GlobalVariables.inspection_in_progress = true


func _on_inspection_exited():
	GlobalVariables.inspection_in_progress = false
	GlobalVariables.present_on_screen_count -= 1
	

func _on_player_present_accepted():
	if is_getting_inspected:
		action_taken = actions.ACCEPT
		compare_actions(correct_action, action_taken)
		finish_inspection()


func _on_player_present_rejected():
	if is_getting_inspected:
		action_taken = actions.REJECT
		await burn_present(gift_box)
		compare_actions(correct_action, action_taken)
		finish_inspection()


func _on_player_present_recycled():
	if is_getting_inspected:
		action_taken = actions.RECYCLE
		compare_actions(correct_action, action_taken)
		finish_inspection()


func _on_tag_need_repair():
	correct_action = actions.RECYCLE

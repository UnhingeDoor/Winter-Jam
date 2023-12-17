extends Node3D

signal present_accepted
signal present_rejected
signal present_recycled


func _on_accept_button_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed == true:
			present_accepted.emit()


func _on_reject_button_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed == true:
			present_rejected.emit()


func _on_recycle_button_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed == true:
			present_recycled.emit()

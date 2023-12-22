extends Node3D

signal present_accepted
signal present_rejected
signal present_recycled
signal XRay


func lock_button():
	if GlobalVariables.inspection_in_progress:
		GlobalVariables.lock_button = true


func _on_ray_cast_3d_button_pressed(button_action):
	if not GlobalVariables.lock_button:
		match button_action:
			"AcceptButton":
				present_accepted.emit()
				lock_button()
			"RejectButton":
				present_rejected.emit()
				lock_button()
			"RecycleButton":
				present_recycled.emit()
				lock_button()
			_:
				print_debug("Non handled button event: ", button_action)

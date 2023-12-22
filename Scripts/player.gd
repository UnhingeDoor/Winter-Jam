extends Node3D

signal present_accepted
signal present_rejected
signal present_recycled
signal XRay

func _on_ray_cast_3d_button_pressed(button_action):
	match button_action:
		"AcceptButton":
			present_accepted.emit()
		"RejectButton":
			present_rejected.emit()
		"RecycleButton":
			present_recycled.emit()
		"XrayButton":
			XRay.emit()
		_:
			print_debug("Non handled button event: ", button_action)

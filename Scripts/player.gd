extends Node3D

signal present_accepted
signal present_rejected
signal present_recycled

func _on_ray_cast_3d_button_pressed(button_action):
	match button_action:
		"AcceptButton":
			present_accepted.emit()
			GlobalVariables.NaughtNiceFixingInput = "Nice"
		"RejectButton":
			GlobalVariables.fire = true
			await get_tree().create_timer(3).timeout
			GlobalVariables.fire = false
			present_rejected.emit()
			GlobalVariables.NaughtNiceFixingInput = "Naughty"
			
		"RecycleButton":
			present_recycled.emit()
		_:
			print_debug("Non handled button event: ", button_action)

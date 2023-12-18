extends RayCast3D

signal button_pressed

var object = null


func _input(event):
	if event is InputEventMouseButton and object != null:
		if event.button_index == 1 and event.pressed == true:
			# Will need to change this to only work with button interactions
			# Probably using collision layers
			var button_action = object.get("name")
			button_pressed.emit(button_action)
			print_debug("From Raycast: ", button_action)


func _physics_process(delta):
	object = get_collider()

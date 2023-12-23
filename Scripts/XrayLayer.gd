extends ColorRect

# Called when the node enters the scene tree for the first time.

func _ready():
	hide()
	pass # Replace with function body.

func _on_player_x_ray():
	if GlobalVariables.xrayOn:
		hide()
	else:
		show()

extends ColorRect

var xrayOn: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_x_ray():
	if xrayOn:
		hide()
		xrayOn = false
	else:
		show()
		xrayOn = true
	
	
	pass # Replace with function body.
	

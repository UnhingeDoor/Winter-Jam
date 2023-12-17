extends Label

var score = 0 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalVariables.inspection_in_progress and Input.is_key_pressed(KEY_SPACE):
		score += 1
		text = "Score: \n%s" % score

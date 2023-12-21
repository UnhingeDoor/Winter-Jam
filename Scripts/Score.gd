extends Label

var score = 0 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GlobalVariables.inspection_in_progress:
		if GlobalVariables.NaughtNiceFixingInput == GlobalVariables.NaughtNiceFixing:
			score += 1
			text = "Score: \n%s" % score

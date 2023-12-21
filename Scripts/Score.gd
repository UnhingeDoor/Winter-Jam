extends Label

var score = 0 

func _process(_delta):
	if GlobalVariables.NaughtNiceFixingInput == GlobalVariables.NaughtNiceFixing:
		score += 1
		text = "Score: \n%s" % score
		GlobalVariables.NaughtNiceFixingInput = "2"
	

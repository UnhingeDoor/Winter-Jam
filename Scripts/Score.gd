extends Label

var score = 0 

func _process(_delta):
	##Unsure how to fix this, May need to figure out once spawning of presents is more defined
	if GlobalVariables.NaughtNiceFixingInput == GlobalVariables.NaughtNiceFixing:
		score += 1
		text = "Score: \n%s" % score
		GlobalVariables.NaughtNiceFixingInput = "2"
	

extends Label3D

signal present_off_wishlist


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text = "Wish Lists\n----------------------\n"
	
	var counter = 0
	var included = randi_range(0, 3)
	GlobalVariables.wishList.shuffle()
	
	
	if included == 1:
		present_off_wishlist.emit()
		text = text + "%s, " % GlobalVariables.wishList[0]
		text = text + "%s, " % GlobalVariables.wishList[1]
		text = text + "%s, " % GlobalVariables.wishList[2]
		text = text + "%s" % GlobalVariables.wishList[3]
	else:
		while counter < 4:
			if counter == included:
				text = text + "%s, " % GlobalVariables.currentPresent
			else:
				text = text + "%s, " % GlobalVariables.wishList[counter]
			counter += counter
		
		
	
	
	
	
	
	text = text+"%s" % GlobalVariables.currentPresent
	text = text+"%s\n\n" % GlobalVariables.naughtyNice[GlobalVariables.presentDataIndex]
	
	
	pass

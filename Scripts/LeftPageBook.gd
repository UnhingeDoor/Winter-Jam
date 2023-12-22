extends Label3D

# Called when the node enters the scene tree for the first time.
func _ready():	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	text = ""
	
	##Displays Three Names at a time (allowing for implementation of wishlist Later on)
	if GlobalVariables.presentDataIndex == 0:
		text = text+"%s --- " % GlobalVariables.firstNames[GlobalVariables.presentDataIndex]
		text = text+"%s\n" % GlobalVariables.naughtyNice[GlobalVariables.presentDataIndex]
		
		text = text+"%s --- " % GlobalVariables.firstNames[GlobalVariables.presentDataIndex+1]
		text = text+"%s\n" % GlobalVariables.naughtyNice[GlobalVariables.presentDataIndex+1]
		
		text = text+"%s --- " % GlobalVariables.firstNames[GlobalVariables.presentDataIndex+1]
		text = text+"%s\n" % GlobalVariables.naughtyNice[GlobalVariables.presentDataIndex+2]
		
	elif GlobalVariables.presentDataIndex < GlobalVariables.firstNames.size() -1:
		text = text+"%s --- " % GlobalVariables.firstNames[GlobalVariables.presentDataIndex-1]
		text = text+"%s\n" % GlobalVariables.naughtyNice[GlobalVariables.presentDataIndex-1]
		
		text = text+"%s --- " % GlobalVariables.firstNames[GlobalVariables.presentDataIndex]
		text = text+"%s\n" % GlobalVariables.naughtyNice[GlobalVariables.presentDataIndex]
		
		text = text+"%s --- " % GlobalVariables.firstNames[GlobalVariables.presentDataIndex+1]
		text = text+"%s\n" % GlobalVariables.naughtyNice[GlobalVariables.presentDataIndex+1]
		
	else:
		text = text+"%s --- " % GlobalVariables.firstNames[GlobalVariables.presentDataIndex-2]
		text = text+"%s\n" % GlobalVariables.naughtyNice[GlobalVariables.presentDataIndex-2]
		
		text = text+"%s --- " % GlobalVariables.firstNames[GlobalVariables.presentDataIndex-1]
		text = text+"%s\n" % GlobalVariables.naughtyNice[GlobalVariables.presentDataIndex-1]
		
		text = text+"%s --- " % GlobalVariables.firstNames[GlobalVariables.presentDataIndex]
		text = text+"%s\n" % GlobalVariables.naughtyNice[GlobalVariables.presentDataIndex]
		
	pass

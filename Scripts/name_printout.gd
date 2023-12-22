extends Label3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = ""
	
	if GlobalVariables.presentDataIndex == 0:
		text = text+"%s " % GlobalVariables.firstNames[GlobalVariables.presentDataIndex]
		text = text+"%s:\n" % GlobalVariables.lastNames[GlobalVariables.presentDataIndex]
		text = text+"%s\n" % GlobalVariables.address[GlobalVariables.presentDataIndex]
		
		text = text+"%s " % GlobalVariables.firstNames[GlobalVariables.presentDataIndex+1]
		text = text+"%s:\n" % GlobalVariables.lastNames[GlobalVariables.presentDataIndex+1]
		text = text+"%s\n" % GlobalVariables.address[GlobalVariables.presentDataIndex+1]
		
		text = text+"%s " % GlobalVariables.firstNames[GlobalVariables.presentDataIndex+2]
		text = text+"%s:\n" % GlobalVariables.lastNames[GlobalVariables.presentDataIndex+2]
		text = text+"%s\n" % GlobalVariables.address[GlobalVariables.presentDataIndex+2]
		
	elif GlobalVariables.presentDataIndex < GlobalVariables.firstNames.size() -1:
		text = text+"%s " % GlobalVariables.firstNames[GlobalVariables.presentDataIndex-1]
		text = text+"%s:\n" % GlobalVariables.lastNames[GlobalVariables.presentDataIndex-1]
		text = text+"%s\n" % GlobalVariables.address[GlobalVariables.presentDataIndex-1]
		
		text = text+"%s " % GlobalVariables.firstNames[GlobalVariables.presentDataIndex]
		text = text+"%s:\n" % GlobalVariables.lastNames[GlobalVariables.presentDataIndex]
		text = text+"%s\n" % GlobalVariables.address[GlobalVariables.presentDataIndex]
		
		text = text+"%s " % GlobalVariables.firstNames[GlobalVariables.presentDataIndex+1]
		text = text+"%s:\n" % GlobalVariables.lastNames[GlobalVariables.presentDataIndex+1]
		text = text+"%s\n" % GlobalVariables.address[GlobalVariables.presentDataIndex+1]
		
	else:
		text = text+"%s " % GlobalVariables.firstNames[GlobalVariables.presentDataIndex-2]
		text = text+"%s:\n" % GlobalVariables.lastNames[GlobalVariables.presentDataIndex-2]
		text = text+"%s\n" % GlobalVariables.address[GlobalVariables.presentDataIndex-2]
		
		text = text+"%s " % GlobalVariables.firstNames[GlobalVariables.presentDataIndex-1]
		text = text+"%s:\n" % GlobalVariables.lastNames[GlobalVariables.presentDataIndex-1]
		text = text+"%s\n" % GlobalVariables.address[GlobalVariables.presentDataIndex-1]
		
		text = text+"%s " % GlobalVariables.firstNames[GlobalVariables.presentDataIndex]
		text = text+"%s:\n" % GlobalVariables.lastNames[GlobalVariables.presentDataIndex]
		text = text+"%s\n" % GlobalVariables.address[GlobalVariables.presentDataIndex]
		
	pass

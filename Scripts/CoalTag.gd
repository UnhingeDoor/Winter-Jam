extends Label3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	text = ""
	text = text + "%s " % GlobalVariables.firstNames[GlobalVariables.presentDataIndex]
	text = text + "%s\n" % GlobalVariables.lastNames[GlobalVariables.presentDataIndex]
	text = text + "%s" % GlobalVariables.address[GlobalVariables.presentDataIndex]

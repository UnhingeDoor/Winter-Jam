extends Label3D

# Called when the node enters the scene tree for the first time.
func _ready():	
	
	text = ""
	
	##Adds all first names to the left side of the page unformatted
	for n in GlobalVariables.firstNames:
		#var temp = n.split()
		text = text+"\n%s" % n


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

extends Label3D

var displayedName= ""
var displayedAddress = ""
var rnd = RandomNumberGenerator.new()

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	##Random chance for incorrect spelling: Address 
	var randomAddress = rnd.randf_range(0,10)
	if randomAddress == 1:
		displayedAddress = GlobalVariables.addressMisspelled[GlobalVariables.presentDataIndex]
		GlobalVariables.NaughtNiceFixing = "Fixing"
	else: 
		displayedAddress = GlobalVariables.address[GlobalVariables.presentDataIndex]
	
	##Random chance for incorrect spelling: Name
	var randomName = rnd.randf_range(0,5)
	if randomName == 1:
		displayedName = GlobalVariables.nameMisspelled[GlobalVariables.presentDataIndex]
		GlobalVariables.NaughtNiceFixing = "Fixing"
	else: 
		displayedName = GlobalVariables.firstNames[GlobalVariables.presentDataIndex] + " " +GlobalVariables.lastNames[GlobalVariables.presentDataIndex] 
	
	##Updates Tag
	if GlobalVariables.updateTag:
		text = ""
		text = text+"%s\n" % displayedName
		text = text+"%s" % displayedAddress
		GlobalVariables.updateTag = false;
	

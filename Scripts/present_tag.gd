extends Label3D

signal Need_repair

var displayedName= ""
var displayedAddress = ""
var rnd = RandomNumberGenerator.new()

func _ready():
	await get_tree().create_timer(1).timeout
	var randomAddress = rnd.randi_range(0,10)
	if randomAddress == 1:
		displayedAddress = GlobalVariables.addressMisspelled[GlobalVariables.presentDataIndex]
		Need_repair.emit()
	else: 
		displayedAddress = GlobalVariables.address[GlobalVariables.presentDataIndex]
		
		##Random chance for incorrect spelling: Name
	var randomName = rnd.randi_range(0,10)
	if randomName == 1:
		displayedName = GlobalVariables.nameMisspelled[GlobalVariables.presentDataIndex]
		Need_repair.emit()
	else: 
		displayedName = GlobalVariables.firstNames[GlobalVariables.presentDataIndex] + " " +GlobalVariables.lastNames[GlobalVariables.presentDataIndex] 
		
		##Updates Tag
	text = ""
	text = text+"%s\n" % displayedName
	text = text+"%s" % displayedAddress

func _process(_delta):
	pass


extends Label

@onready var score_label: Label = $Score
@onready var mistakes_label: Label = get_node("../Mistakes")


func _ready():
	pass
	
func _process(_delta):
	text = "Score: \n%s" % GlobalVariables.score
	mistakes_label.text = "Mistakes: \n%s" % GlobalVariables.mistakes

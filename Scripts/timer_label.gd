extends Label3D

@onready var level_timer: Timer = get_tree().root.get_node("Main/LevelTimer")

func _process(_delta):
	var time_left = String.num(level_timer.time_left, 0)
	text = "%ss" % time_left

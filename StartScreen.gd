extends Control

@onready var tree = get_tree()
@onready var main_scene: PackedScene = preload("res://Scenes/Main.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	$StartMain.show()
	$StartTutorial.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	tree.change_scene_to_packed(main_scene)


func _on_tutorial_button_pressed():
	$StartMain.hide()
	$StartTutorial.show()



func _on_back_button_pressed():
	$StartTutorial.hide()
	$StartMain.show()

extends Control

@onready var tree = get_tree()
@export var main_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	main_scene = load("res://Scenes/main.tscn")
	load_menu()


func load_menu():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if GlobalVariables.menu_state == "FAILED":
		$Won.hide()
		$StartMain.hide()
		$StartTutorial.hide()
		$Retry.show()
	elif GlobalVariables.menu_state == "WON":
		$Won.show()
		$StartMain.hide()
		$StartTutorial.hide()
		$Retry.hide()
	else: # Start
		$Won.hide()
		$StartMain.show()
		$StartTutorial.hide()
		$Retry.hide()


func _on_start_button_pressed():
	tree.change_scene_to_packed(main_scene)


func _on_tutorial_button_pressed():
	$StartMain.hide()
	$StartTutorial.show()


func _on_back_button_pressed():
	$StartTutorial.hide()
	$StartMain.show()


func _on_retry_button_pressed():
	tree.change_scene_to_packed(main_scene)


func _on_back_to_menu_pressed():
	$Won.hide()
	$StartMain.show()
	$StartTutorial.hide()
	$Retry.hide()

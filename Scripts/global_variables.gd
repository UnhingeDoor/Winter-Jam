extends Node

@export var inspection_in_progress: bool = false
@export var present_on_screen_count: int = 1

#database information
@export var firstNames := []
@export var lastNames := []
@export var nameMisspelled := []
@export var naughtyNice := []
@export var address := []
@export var addressMisspelled := []

@export var presentDataIndex = 0
@export var updateTag: bool = true
@export var updateNNBook: bool = true
@export var NaughtNiceFixing = "1"
@export var NaughtNiceFixingInput = "2"

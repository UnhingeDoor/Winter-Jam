extends Node

@export var inspection_in_progress: bool = false
@export var present_on_screen_count: int = 1
@export var lock_button: bool = false

@export var score: int = 0

#database information
@export var firstNames := []
@export var lastNames := []
@export var nameMisspelled := []
@export var naughtyNice := []
@export var address := []
@export var addressMisspelled := []
@export var wishList :=[]

@export var presentDataIndex = 0
@export var fire: bool = false

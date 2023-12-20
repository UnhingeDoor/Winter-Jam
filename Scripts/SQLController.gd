extends Control

var database : SQLite

# Called when the node enters the scene tree for the first time.
func _ready():
	##Creates database file
	database = SQLite.new()
	database.path="res://data.db"
	database.open_db()
	
	##Defines the data table
	var table = {
		"id" : {"data_type":"int", "primary_key": true, "not_null": true, "auto_increment" : true},
		"firstName" : {"data_type":"text"},
		"lastName" : {"data_type":"text"},
		"nameMisspelling" : {"data_type":"text"},
		"address" : {"data_type":"text"},
		"addMisspelling" : {"data_type":"text"},
		"naughtNice" : {"data_type":"text"},
		"wishList" : {"data_type":"text"}
	} 
	
	database.create_table("presents", table)
	
	##Adds the data
	#var data = {
		#"firstName" : $firstName.text,
		#"lastName" : $lastName.text,
		#"nameMisspelling" : $nameMis.text,
		#"address" : $address.text,
		#"naughtNice" : $naughtNice.text
	#}
	#
	#database.insert_row("presents", data)
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

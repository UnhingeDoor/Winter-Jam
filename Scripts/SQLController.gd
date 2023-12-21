extends Control

var database : SQLite

# Called when the node enters the scene tree for the first time.
func _ready():
	##Creates database file
	database = SQLite.new()
	database.path="res://data.db"
	database.open_db()
	
	##Defines the data table
	#var table = {
		#"id" : {"data_type":"int", "primary_key": true, "not_null": true, "auto_increment" : true},
		#"firstName" : {"data_type":"text"},
		#"lastName" : {"data_type":"text"},
		#"nameMisspelling" : {"data_type":"text"},
		#"address" : {"data_type":"text"},
		#"addMisspelling" : {"data_type":"text"},
		#"naughtyNice" : {"data_type":"text"},
		#"wishList" : {"data_type":"text"}
	#} 
	#
	#database.create_table("presents", table)
	
	##Database has been created and data added	
	
	##Collecting data from the database
	var tableName = "presents"
	database.query("select * from " + tableName + ";")
	for i in range(0, database.query_result.size()):
		GlobalVariables.firstNames.push_back(database.query_result[i]["firstName"])
	for i in range(0, database.query_result.size()):
		GlobalVariables.naughtyNice.push_back(database.query_result[i]["naughtyNice"])
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

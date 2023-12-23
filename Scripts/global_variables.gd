extends Node

@export var inspection_in_progress: bool = false
@export var present_on_screen_count: int = 1
@export var lock_button: bool = false

@export var score: int = 0
@export var mistakes: int = 0

#database information
@export var firstNames := ["Emma", "Liam", "Olivia","Noah","Ava","Isabella","Sophia","Jackson","Lucas","Mia","Aiden","Harper","Evelyn","Oliver","Amelia"]
@export var lastNames := ["Smith","Johnson","Williams","Jones","Brown","Davis","Miller","Wilson","Moore","Taylor","Anderson","Thomas","Jackson","White","Harris"]
@export var nameMisspelled := ["Ema Smth","Liiam Johnson","Olivia Wiliams","Noa Jonnes","Ava Browne","Isabella Davis","Sofiya Millar","Jackson Wilsin",
"Lukas Moorr","Mia Tayllor","Aidan Andersonn","Harpar Thommas","Evelyn Jakson","Oliver Whyte","Amelya Harriss"]
@export var naughtyNice := ["Naughty","Nice","Naughty","Naughty","Nice","Nice","Naughty","Nice","Naughty","Nice","Nice","Nice","Naughty","Nice","Nice"]
@export var address := ["125 Maple Street, Toronto, Ontario, Canada","45 Rose Avenue, London, England, United Kingdom","710 Cherry Blossom Lane, Tokyo, Japan",
"789 Cascade Terrace, Sydney, New South Wales, Australia","230 Pine Street, Cape Town, South Africa","102 Alpine Way, Zurich, Switzerland","550 Via Roma, Rome, Italy",
"33 Samba Boulevard, Rio de Janeiro, Brazil","420 Tulip Lane, Amsterdam, Netherlands",
"775 Rue de la Seine, Paris, France","88 Golden Gate Road, San Francisco, California, USA","301 Fiesta Street, Mexico City, Mexico",
"555 Acacia Avenue, Nairobi, Kenya","200 Red Square, Moscow, Russia","123 Kangaroo Lane, Melbourne, Victoria, Australia"]
@export var addressMisspelled := [
"125 Maple Street, Torronto, Ontario, Canada",
"45 Rose Avenue, Londan, England, United Kingdom",
"710 Cherry Blossom Lane, Tokio, Japan",
"789 Cascade Terrance, Sidney, New South Wales, Australia",
"230 Pine Street, Cape Tonw, South Africa",
"102 Alpine Way, Zurik, Switzerland",
"550 Via Roma, Roome, Italy",
"33 Samba Boulavard, Rio de Janeiro, Brazil",
"420 Tulip Lane, Amsterdm, Netherlands",
"775 Rue de la Sienne, Paree, France",
"88 Goldn Gate Road, San Franciso, California, USA",
"301 Fiesta Stret, Mexico City, Mexico",
"555 Acasia Avenue, Nairobii, Kenya",
"200 Red Sqaure, Moskow, Russia",
"123 Kangaroo Lane, Melbournee, Victoria, Australia"]
@export var wishList := ["Building blocks","Puzzle","Toy car","Playdough","Jump rope","Storybook","Finger paints","Board game","Doll","Kids gardening kit","Superhero cape"]


@export var xrayOn: bool = false
@export var updateBook: bool = true
@export var presentDataIndex = 0
@export var fire: bool = false
@export var currentPresent = ""


@export var menu_state: String = "START"

extends Node

#const DOOR_ROOM = preload("uid://d4e44bmv7v4a8")
#const POTION_ROOM = preload("uid://bhw6wla03kf07")
#const BOOK_ROOM = preload("uid://bfuf633hqqloi")

var can_move = true #controls if player can move or not
var is_alert = false
var has_key = false
var has_timer = false
var did_timer = false
var has_mushrooms = false
func _ready():
	SignalManager.timer_went_off.connect(_on_timer_went_off)
	
func _on_timer_went_off():
	did_timer = true
	
#func _on_got_key_item(key_item):
	#match key_item:
		#"key":
			#has_key = true
			#DOOR_ROOM.get_child("interact").prereq_met = true
		#"timer":
			#has_key = true
			#DOOR_ROOM.get_child("interact").prereq_met = true

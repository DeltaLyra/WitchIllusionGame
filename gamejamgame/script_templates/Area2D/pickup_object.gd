extends "res://Scripts/pickup_object.gd"



func _ready() -> void:
	item.texture = preload("res://Assets/PlaceHolderRockItem.png") #replace with preload of item's image (to get this quickly drag the image into the script and release while holding ctrl
	item_name = "rock" # replace with item name

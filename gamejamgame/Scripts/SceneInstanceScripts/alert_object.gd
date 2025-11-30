extends "res://Scripts/alert_object.gd"
func _ready():
	will_be_pickup = true
	pickup_texture =  preload("res://Assets/PlaceHolderGlassPile.png")
	super() #Does what original parent script did in _ready function, aka set values to position and parent variables 

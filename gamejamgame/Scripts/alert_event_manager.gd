extends Node2D

@export var room_item: String # The item you must transform with to 

const EYE_BAT = preload("res://Scenes/eye_bat.tscn") #loads eyebat scene so we can instantiate it

func _ready() -> void:
	SignalManager.alert.connect(_on_alert)

func _on_alert():
	print("signal received!")
	spawn_eye()
	

func spawn_eye ():
	var eye_bat = EYE_BAT.instantiate() #Instantiate eye bat
	add_sibling(eye_bat) #add_sibling function makes it so we can just directly add it to the level scene without getting the parent of this scene first 
	eye_bat.get_node("AnimationPlayer").play("fly_around") #Start the flight animation, making sure to get the animation node from our scene
	print("bat moved!")

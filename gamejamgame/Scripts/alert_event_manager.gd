extends Node2D

@export var room_item: String # The item you must transform with to 

const EYE_BAT = preload("res://Scenes/eye_bat.tscn") #loads eyebat scene so we can instantiate it
@onready var timer: Timer = $Timer #ref var to timer so we can make it start when alert signal is received.

func _ready() -> void:
	SignalManager.alert.connect(_on_alert)

func _on_alert(): #when alert signal is received, start the timer
	print("signal received!")
	timer.start()
	print("timer started!")
	
func _spawn_eye ():
	var eye_bat = EYE_BAT.instantiate() #Instantiate eye bat
	add_sibling(eye_bat) #add_sibling function makes it so we can just directly add it to the level scene without getting the parent of this scene first 
	eye_bat.get_node("AnimationPlayer").play("fly_around") #Start the flight animation, making sure to get the animation node from our scene
	print("bat moved!")

func _on_timer_timeout() -> void: #once the timer runs out, spawn the bat and see if the player transformed into the right object.
	print("times up!")
	_spawn_eye()

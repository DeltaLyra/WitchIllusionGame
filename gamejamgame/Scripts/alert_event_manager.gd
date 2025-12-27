extends Node2D

@export var room_item: String # The item you must transform with to 
@onready var inv = preload("res://inventory/playerInv.tres")

const EYE_BAT = preload("res://Scenes/eye_bat.tscn") #loads eyebat scene so we can instantiate it
@onready var timer: Timer = $Timer #ref var to timer so we can make it start when alert signal is received.
var level
var player
var sprite
var item 
var allow_select = false # so the player cant pick the item before the alert happens
func _ready() -> void:
	SignalManager.alert.connect(_on_alert)
	level = self.get_parent()
	player = level.get_node("Player") 
	sprite = player.get_node("AnimatedSprite2D") # get reference to player and then its sprite so we can change it for transformation

func _on_alert(): #when alert signal is received, start the timer
	print("signal received!")
	allow_select = true
	timer.start()
	print("timer started!")
	
func _spawn_eye ():
	var eye_bat = EYE_BAT.instantiate() #Instantiate eye bat
	add_sibling(eye_bat) #add_sibling function makes it so we can just directly add it to the level scene without getting the parent of this scene first 
	eye_bat.get_node("AnimationPlayer").play("fly_around") #Start the flight animation, making sure to get the animation node from our scene
	print("bat moved!")

func _input(event: InputEvent) -> void:
	if (allow_select):
		if event.is_action_pressed("1"):
			if(inv.slots[0].item != null):
				item = inv.slots[0].item.name
		elif event.is_action_pressed("2"):
			if(inv.slots[1].item != null):
				item = inv.slots[1].item.name
		elif(event.is_action_pressed("3")):
			if (inv.slots[2].item != null):
				item = inv.slots[2].item.name
		_transform_player()

func _transform_player(): #add parameter for what item the player uses
	print("transform")
	match item:
		"rock":
			sprite.play("Rock")
			print("rock!")
			DataManager.can_move = false;
		"cheese":
			sprite.play("Cheese")
			print("cheese!")
			DataManager.can_move = false;
		_:
			print("oops")
func _on_timer_timeout() -> void: #once the timer runs out, spawn the bat and see if the player transformed into the right object.
	allow_select = false;
	print("times up!")
	_spawn_eye()
	if (item != room_item):
		print("Gameover!")
	else: 
		sprite.play("Idle")
		DataManager.can_move = true;

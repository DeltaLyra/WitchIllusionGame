extends Area2D

@onready var icon: Sprite2D = $Icon
@onready var item: Sprite2D = $Item
@export var item_name: String #Variable for the items name so we can send it when emitting out got_item signal
@export var item_image = preload("res://Assets/PlaceHolderRockItem.png")
@export var node_name = "rock" 
 

func _ready():
	item.texture = item_image 

#When the item is hovered over, the click icon will appear. When it leaves, it will disappear.
func _on_mouse_entered() -> void:
	icon.visible = true

func _on_mouse_exited() -> void:
	icon.visible = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#We don't need to use the information from any of these parameters except the input type to check it was a mouse click. We don't care what shape is being clicked or what viewport it's in.
	#Using an action I defined in input map because it's simpler than using the button index stuff
	#FIXED THAT MULTIPLE CLICK FIRING BUG!!
	if event.is_action_pressed("LeftMouseClick"):
		SignalManager.got_item.emit(item_name)
		print("Got item!")
		queue_free()

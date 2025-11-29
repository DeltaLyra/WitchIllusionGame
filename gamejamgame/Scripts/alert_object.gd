extends Area2D

@onready var icon: Sprite2D = $Icon
@onready var item: Sprite2D = $Item
const PLACE_HOLDER_GLASS_PILE = preload("res://Assets/PlaceHolderGlassPile.png") 
const PICKUP_OBJECT = preload("res://Scenes/pickup_object.tscn") #Make a reference to the pickup object scene since some of these items will become pickups after being interacted with. Instantiate later.
var alert_object_parent = get_parent() #Gets the parent of this object (the level) so we can add the pickup object to it
#When the item is hovered over, the click icon will appear. When it leaves, it will disappear.
func _on_mouse_entered() -> void:
	icon.visible = true

func _on_mouse_exited() -> void:
	icon.visible = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#We don't need to use the information from any of these parameters except the input type to check it was a mouse click. We don't care what shape is being clicked or what viewport it's in.
	#Using an action I defined in input map because it's simpler than using the button index stuff... work smarter not harder kids
	#Tried using echo to prevent it from firing multiple times 
	#It still fired multiple times... but we remove the item before you release it anyway so we don't worry about that ;)
	if event.is_action("LeftMouseClick"):
		print("Triggered alert event!")
		#item.texture = PLACE_HOLDER_GLASS_PILE
		queue_free()
		var pickup_object = PICKUP_OBJECT.instantiate() #Instantiate a pickup item scene so we can add it
		add_child(pickup_object)

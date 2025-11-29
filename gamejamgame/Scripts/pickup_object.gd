extends Area2D

@onready var icon: Sprite2D = $Icon #Reference variable to our clicker icon

#When the item is hovered over, the click icon will appear. When it leaves, it will disappear.
func _on_mouse_entered() -> void:
	icon.visible = true

func _on_mouse_exited() -> void:
	icon.visible = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#We don't need to use the information from any of these parameters except the input type to check it was a mouse click. We don't care what shape is being clicked or what viewport it's in.
	#Using an action I defined in input map because it's simpler than using the button index stuff... work smarter not harder kids
	#Also used echo to prevent it from firing multiple times 
	#It still fired multiple times... but we remove the item anyway so we don't worry about that ;)
	if event.is_action("LeftMouseClick"):
		print("Got item!")
		queue_free()

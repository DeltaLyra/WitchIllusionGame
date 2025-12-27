extends Area2D

@onready var icon: Sprite2D = $Icon
@onready var object: Sprite2D = $Object
@export var item: InvItem
 

func _ready():
	object.texture = item.texture

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
		SignalManager.got_item.emit(item)
		queue_free()

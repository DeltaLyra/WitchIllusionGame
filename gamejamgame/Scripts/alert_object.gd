extends Area2D

@onready var icon: Sprite2D = $Icon
@onready var item: Sprite2D = $Item
@export var texture: Texture #So we can customise texture for each instance
const PICKUP_OBJECT = preload("res://Scenes/pickup_object.tscn") #Load the pickup object scene since some of these items will become pickups after being interacted with. Instantiate later.
var alert_object_parent #To hold the parent of this object (the level) so we can add the pickup object to it. Dont get parent yet though ot it'll give us null
var alert_object_pos #so we can put the pickup object in the same spot. only give value once ready
@export var will_be_pickup = false #Wont become a pickup by default, change if its supposed to become one
@export var pickup_item: InvItem #the pickup item this will become, if it becomes a pickup item. Given a value in instances of this scene
@export var will_remove = true
@export var is_clickable = true # some only show up under certain conditions
@export var prequisite: String
func _ready():
	alert_object_parent = get_parent() #Only give var a value once its ready so we dont get null
	alert_object_pos = position #Also need to do when ready so it actually has a position to give
	item.texture = texture
	if(prequisite == "key" and DataManager.has_key == true):
		is_clickable = true
	elif(prequisite == "mushrooms" and DataManager.has_mushrooms == true):
		is_clickable = true
	elif(prequisite == "timer" and DataManager.has_timer == true):
		is_clickable = true
		self.visible = true
#When the item is hovered over, the click icon will appear. When it leaves, it will disappear.
func _on_mouse_entered() -> void:
	if(is_clickable):
		icon.visible = true

func _on_mouse_exited() -> void:
	icon.visible = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#We don't need to use the information from any of these parameters except the input type to check it was a mouse click. We don't care what shape is being clicked or what viewport it's in.
	#Using an action I defined in input map because it's simpler than using the button index stuff
	if (is_clickable):
		if event.is_action_pressed("LeftMouseClick"):
			SignalManager.alert.emit()
			print("Triggered alert event!")
			if(will_remove):
				queue_free()
			if will_be_pickup:
				var pickup_object = PICKUP_OBJECT.instantiate() #Instantiate a pickup item scene so we can add it
				pickup_object.position = alert_object_pos #set position equal to the alert objects position
				pickup_object.item = pickup_item
				alert_object_parent.add_child(pickup_object) #add as a child to the level (the parent of this scene)
				print("Worked :D")
	

extends Area2D

@onready var icon: Sprite2D = $Icon
@onready var object: Sprite2D = $Object
@export var item: InvItem
@export var key_item = "n/a" # if not key item, n/a
@export var is_clickable = true # some only show up under certain conditions


func _ready():
	object.texture = item.texture
	SignalManager.alert.connect(_on_alert)

#When the item is hovered over, the click icon will appear. When it leaves, it will disappear.
func _on_mouse_entered() -> void:
	if(is_clickable):
		print("icon")
		icon.visible = true

func _on_mouse_exited() -> void:
	icon.visible = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#We don't need to use the information from any of these parameters except the input type to check it was a mouse click. We don't care what shape is being clicked or what viewport it's in.
	#Using an action I defined in input map because it's simpler than using the button index stuff
	#FIXED THAT MULTIPLE CLICK FIRING BUG!!
	if (event.is_action_pressed("LeftMouseClick")):
		if (is_clickable):
			if (key_item == "key"): #Key items dont go into visible inventory
				DataManager.has_key = true
				SignalManager.got_key_item.emit("key")
			elif (item.name == "mushrooms"):
				DataManager.has_mushrooms = true
				SignalManager.got_key_item.emit("mushrooms")
			elif (key_item == "timer"):
				DataManager.has_timer = true
				SignalManager.got_key_item.emit("timer")
			elif(key_item == "n/a"):
				SignalManager.got_item.emit(item) # what to do if just regular item
			queue_free()
func _on_alert():
	if(item.name == "key" and DataManager.has_mushrooms == true):
		self.visible = true 
		is_clickable = true
	if(item.name == "cheese"):
		is_clickable = true

extends Control

@onready var inv = preload("res://inventory/playerInv.tres")
@onready var slots = $NinePatchRect/GridContainer.get_children()

func _ready():
	inv.update.connect(update_slots)
	process_mode = Node.PROCESS_MODE_ALWAYS
	update_slots()

func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])

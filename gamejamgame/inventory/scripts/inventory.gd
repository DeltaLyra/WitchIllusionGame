extends Resource

class_name Inv

signal update

@export var slots: Array[InvSlot]

func insert(item: InvItem):
	var itemslots = slots.filter(func(slot): return slot.item == item)
	if  !itemslots.is_empty ():
		itemslots[0].amount += 1
	else:
		var emptyslots = slots.filter(func(slot): return slot.item == null)
		if  !emptyslots.is_empty ():
			itemslots[0].item = item
			itemslots[0].amount = 1
		update.emit()
		
func add_item(item: InvItem, amount := 1):
	for slot in slots:
		if slot.item == item:
			slot.amount += amount
			emit_signal("update")
			return

	for slot in slots:
		if slot.item == null:
			slot.item = item
			slot.amount = amount
			emit_signal("update")
			return
